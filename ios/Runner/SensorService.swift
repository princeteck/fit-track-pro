import Foundation
import CoreMotion
import UserNotifications
import UIKit

class SensorService: NSObject {
    
    private var isHeartRateMonitoring = false
    private var isWorkoutTracking = false
    private var isWorkoutPaused = false
    private var heartRateTimer: Timer?
    private var workoutTimer: Timer?
    
    // Mock sensor data
    private var currentHeartRate = 72
    private var totalSteps = 0
    private var totalCalories = 0
    private var workoutStartTime: Date?
    private var pausedDuration: TimeInterval = 0
    private var lastPauseTime: Date?
    
    // Core Motion for step tracking (simulated)
    private let motionManager = CMMotionManager()
    private let pedometer = CMPedometer()
    
    override init() {
        super.init()
        setupMotionManager()
    }
    
    private func setupMotionManager() {
        if CMMotionManager.shared.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 1.0
        }
    }
    
    // MARK: - Heart Rate Monitoring
    
    func startHeartRateMonitoring(completion: @escaping (String?) -> Void) {
        guard !isHeartRateMonitoring else {
            completion(nil)
            return
        }
        
        isHeartRateMonitoring = true
        
        // Start heart rate simulation timer
        heartRateTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            self?.simulateHeartRateReading()
        }
        
        completion(nil)
    }
    
    func stopHeartRateMonitoring(completion: @escaping (String?) -> Void) {
        isHeartRateMonitoring = false
        heartRateTimer?.invalidate()
        heartRateTimer = nil
        completion(nil)
    }
    
    func getHeartRateReading() -> Int {
        return simulateHeartRateReading()
    }
    
    private func simulateHeartRateReading() -> Int {
        // Simulate realistic heart rate variations
        let baseRate = isWorkoutTracking ? 140 : 72
        let variation = Int.random(in: -10...10)
        currentHeartRate = max(60, min(200, baseRate + variation))
        return currentHeartRate
    }
    
    // MARK: - Workout Tracking
    
    func startWorkoutTracking(completion: @escaping (String?) -> Void) {
        guard !isWorkoutTracking else {
            completion(nil)
            return
        }
        
        isWorkoutTracking = true
        workoutStartTime = Date()
        totalSteps = 0
        totalCalories = 0
        
        // Start workout simulation timer
        workoutTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.simulateWorkoutData()
            self?.scheduleWorkoutNotification()
        }
        
        // Start step tracking if available
        startStepTracking()
        
        // Send initial notification
        scheduleWorkoutNotification()
        
        completion(nil)
    }
    
    func stopWorkoutTracking(completion: @escaping (String?) -> Void) {
        isWorkoutTracking = false
        isWorkoutPaused = false
        workoutTimer?.invalidate()
        workoutTimer = nil
        workoutStartTime = nil
        pausedDuration = 0
        lastPauseTime = nil
        
        // Stop step tracking
        stopStepTracking()
        
        // Remove notifications
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        completion(nil)
    }
    
    func toggleWorkoutPause() {
        guard isWorkoutTracking else { return }
        
        isWorkoutPaused = !isWorkoutPaused
        
        if isWorkoutPaused {
            lastPauseTime = Date()
        } else {
            // Add paused time to total paused duration
            if let pauseTime = lastPauseTime {
                pausedDuration += Date().timeIntervalSince(pauseTime)
                lastPauseTime = nil
            }
        }
        
        scheduleWorkoutNotification()
    }
    
    func getWorkoutData() -> [String: Any] {
        let duration: TimeInterval
        if let startTime = workoutStartTime {
            let totalTime = Date().timeIntervalSince(startTime)
            let activePausedTime = isWorkoutPaused && lastPauseTime != nil 
                ? Date().timeIntervalSince(lastPauseTime!) 
                : 0
            duration = totalTime - pausedDuration - activePausedTime
        } else {
            duration = 0
        }

        return [
            "heartRate": currentHeartRate,
            "steps": totalSteps,
            "calories": totalCalories,
            "duration": Int(duration),
            "isPaused": isWorkoutPaused,
            "isActive": isWorkoutTracking
        ]
    }    private func simulateWorkoutData() {
        guard isWorkoutTracking && !isWorkoutPaused else { return }
        
        // Simulate steps (1-3 steps per second during workout)
        totalSteps += Int.random(in: 1...3)
        
        // Simulate calories burned (roughly 1 calorie per 20 steps)
        totalCalories = totalSteps / 20
        
        // Update heart rate
        _ = simulateHeartRateReading()
    }
    
    // MARK: - Step Tracking
    
    private func startStepTracking() {
        guard CMPedometer.isStepCountingAvailable() else { return }
        
        pedometer.startUpdates(from: Date()) { [weak self] data, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                // In a real app, you'd use actual step data
                // For simulation, we'll continue using our mock data
            }
        }
    }
    
    private func stopStepTracking() {
        pedometer.stopUpdates()
    }
    
    // MARK: - Notifications
    
    private func scheduleWorkoutNotification() {
        let content = UNMutableNotificationContent()
        content.title = isWorkoutPaused ? "Workout Paused" : "Workout in Progress"
        
        let duration: String
        if let startTime = workoutStartTime {
            let totalTime = Date().timeIntervalSince(startTime)
            let activePausedTime = isWorkoutPaused && lastPauseTime != nil 
                ? Date().timeIntervalSince(lastPauseTime!) 
                : 0
            let activeTime = Int(totalTime - pausedDuration - activePausedTime)
            duration = String(format: "%02d:%02d", activeTime / 60, activeTime % 60)
        } else {
            duration = "00:00"
        }
        
        let statusIcon = isWorkoutPaused ? "⏸️" : "▶️"
        content.body = "\(statusIcon) ❤️ \(currentHeartRate) BPM | 🔥 \(totalCalories) cal | 👟 \(totalSteps) steps | ⏱️ \(duration)"
        content.sound = .none
        
        // Add action buttons
        let pauseAction = UNNotificationAction(identifier: "PAUSE_ACTION", title: "Pause", options: [])
        let stopAction = UNNotificationAction(identifier: "STOP_ACTION", title: "Stop", options: [.destructive])
        let category = UNNotificationCategory(identifier: "WORKOUT_CATEGORY", actions: [pauseAction, stopAction], intentIdentifiers: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        content.categoryIdentifier = "WORKOUT_CATEGORY"
        
        let request = UNNotificationRequest(identifier: "workout_progress", content: content, trigger: nil)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }
    
    // MARK: - Background Processing
    
    func enableBackgroundRefresh() {
        // Request background app refresh
        DispatchQueue.main.async {
            UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
        }
    }
    
    func handleBackgroundRefresh(completion: @escaping (UIBackgroundFetchResult) -> Void) {
        if isWorkoutTracking {
            // Continue workout tracking in background
            simulateWorkoutData()
            scheduleWorkoutNotification()
            completion(.newData)
        } else {
            completion(.noData)
        }
    }
}
