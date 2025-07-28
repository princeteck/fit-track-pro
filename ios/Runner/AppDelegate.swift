import Flutter
import UIKit
import UserNotifications
import CoreMotion

@main
@objc class AppDelegate: FlutterAppDelegate, UNUserNotificationCenterDelegate {
    
    private let CHANNEL = "com.sonawanes.fittrack_pro/sensors"
    private var sensorService: SensorService?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        GeneratedPluginRegistrant.register(with: self)
        
        // Initialize sensor service
        sensorService = SensorService()
        
        // Request notification permissions
        UNUserNotificationCenter.current().delegate = self
        requestNotificationPermissions()
        
        // Set up method channel
        guard let controller = window?.rootViewController as? FlutterViewController else {
            fatalError("rootViewController is not type FlutterViewController")
        }
        
        let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
        
        channel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            guard let self = self, let sensorService = self.sensorService else {
                result(FlutterError(code: "UNAVAILABLE", message: "Sensor service not available", details: nil))
                return
            }
            
            switch call.method {
            case "startHeartRateMonitoring":
                sensorService.startHeartRateMonitoring { error in
                    if let error = error {
                        result(FlutterError(code: "UNAVAILABLE", message: error, details: nil))
                    } else {
                        result(nil)
                    }
                }
            case "stopHeartRateMonitoring":
                sensorService.stopHeartRateMonitoring { error in
                    if let error = error {
                        result(FlutterError(code: "UNAVAILABLE", message: error, details: nil))
                    } else {
                        result(nil)
                    }
                }
            case "getHeartRateReading":
                let heartRate = sensorService.getHeartRateReading()
                result(heartRate)
            case "startWorkoutTracking":
                sensorService.startWorkoutTracking { error in
                    if let error = error {
                        result(FlutterError(code: "UNAVAILABLE", message: error, details: nil))
                    } else {
                        result(nil)
                    }
                }
            case "stopWorkoutTracking":
                sensorService.stopWorkoutTracking { error in
                    if let error = error {
                        result(FlutterError(code: "UNAVAILABLE", message: error, details: nil))
                    } else {
                        result(nil)
                    }
                }
            case "getWorkoutData":
                let workoutData = sensorService.getWorkoutData()
                result(workoutData)
            default:
                result(FlutterMethodNotImplemented)
            }
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permissions granted")
            } else {
                print("Notification permissions denied")
            }
        }
    }
    
    // MARK: - UNUserNotificationCenterDelegate
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Handle notification tap
        completionHandler()
    }
}
