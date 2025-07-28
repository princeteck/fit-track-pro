package com.sonawanes.fittrack_pro

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.os.PowerManager
import androidx.core.app.NotificationCompat
import kotlin.random.Random

class SensorService(private val context: Context) {
    
    private var isHeartRateMonitoring = false
    private var isWorkoutTracking = false
    private var heartRateHandler: Handler? = null
    private var workoutHandler: Handler? = null
    private var wakeLock: PowerManager.WakeLock? = null
    
    // Mock sensor data
    private var currentHeartRate = 72
    private var totalSteps = 0
    private var totalCalories = 0
    private var workoutStartTime = 0L
    
    companion object {
        private const val NOTIFICATION_CHANNEL_ID = "workout_tracking"
        private const val NOTIFICATION_ID = 1001
        private const val HEART_RATE_UPDATE_INTERVAL = 5000L // 5 seconds
        private const val WORKOUT_UPDATE_INTERVAL = 1000L // 1 second
    }
    
    fun startHeartRateMonitoring() {
        if (isHeartRateMonitoring) return
        
        isHeartRateMonitoring = true
        heartRateHandler = Handler(Looper.getMainLooper())
        
        // Start simulating heart rate data
        heartRateHandler?.post(object : Runnable {
            override fun run() {
                if (isHeartRateMonitoring) {
                    simulateHeartRateReading()
                    heartRateHandler?.postDelayed(this, HEART_RATE_UPDATE_INTERVAL)
                }
            }
        })
    }
    
    fun stopHeartRateMonitoring() {
        isHeartRateMonitoring = false
        heartRateHandler?.removeCallbacksAndMessages(null)
        heartRateHandler = null
    }
    
    fun getHeartRateReading(): Int {
        // Simulate getting a heart rate reading
        return simulateHeartRateReading()
    }
    
    fun startWorkoutTracking() {
        if (isWorkoutTracking) return
        
        isWorkoutTracking = true
        workoutStartTime = System.currentTimeMillis()
        totalSteps = 0
        totalCalories = 0
        
        // Acquire wake lock to prevent screen sleep
        acquireWakeLock()
        
        // Create notification channel for Android O+
        createNotificationChannel()
        
        // Start foreground service with notification
        showWorkoutNotification()
        
        // Start workout simulation
        workoutHandler = Handler(Looper.getMainLooper())
        workoutHandler?.post(object : Runnable {
            override fun run() {
                if (isWorkoutTracking) {
                    simulateWorkoutData()
                    updateWorkoutNotification()
                    workoutHandler?.postDelayed(this, WORKOUT_UPDATE_INTERVAL)
                }
            }
        })
    }
    
    fun stopWorkoutTracking() {
        isWorkoutTracking = false
        workoutHandler?.removeCallbacksAndMessages(null)
        workoutHandler = null
        
        // Release wake lock
        releaseWakeLock()
        
        // Hide notification
        hideWorkoutNotification()
    }
    
    fun getWorkoutData(): Map<String, Any> {
        val duration = if (workoutStartTime > 0) {
            (System.currentTimeMillis() - workoutStartTime) / 1000
        } else 0
        
        return mapOf(
            "heartRate" to currentHeartRate,
            "steps" to totalSteps,
            "calories" to totalCalories,
            "duration" to duration
        )
    }
    
    private fun simulateHeartRateReading(): Int {
        // Simulate realistic heart rate variations
        val baseRate = if (isWorkoutTracking) 140 else 72
        val variation = Random.nextInt(-10, 11)
        currentHeartRate = (baseRate + variation).coerceIn(60, 200)
        return currentHeartRate
    }
    
    private fun simulateWorkoutData() {
        // Simulate steps (1-3 steps per second during workout)
        if (isWorkoutTracking) {
            totalSteps += Random.nextInt(1, 4)
            
            // Simulate calories burned (roughly 1 calorie per 20 steps)
            totalCalories = totalSteps / 20
            
            // Update heart rate
            simulateHeartRateReading()
        }
    }
    
    private fun acquireWakeLock() {
        val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
        wakeLock = powerManager.newWakeLock(
            PowerManager.PARTIAL_WAKE_LOCK,
            "FitTrackPro::WorkoutWakeLock"
        )
        wakeLock?.acquire(10*60*1000L /*10 minutes*/)
    }
    
    private fun releaseWakeLock() {
        wakeLock?.let {
            if (it.isHeld) {
                it.release()
            }
        }
        wakeLock = null
    }
    
    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val name = "Workout Tracking"
            val descriptionText = "Shows workout progress and controls"
            val importance = NotificationManager.IMPORTANCE_LOW
            val channel = NotificationChannel(NOTIFICATION_CHANNEL_ID, name, importance).apply {
                description = descriptionText
            }
            
            val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(channel)
        }
    }
    
    private fun showWorkoutNotification() {
        val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val notification = createWorkoutNotification()
        notificationManager.notify(NOTIFICATION_ID, notification)
    }
    
    private fun updateWorkoutNotification() {
        val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val notification = createWorkoutNotification()
        notificationManager.notify(NOTIFICATION_ID, notification)
    }
    
    private fun hideWorkoutNotification() {
        val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.cancel(NOTIFICATION_ID)
    }
    
    private fun createWorkoutNotification(): Notification {
        val intent = Intent(context, MainActivity::class.java)
        val pendingIntent = PendingIntent.getActivity(
            context, 0, intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        
        val duration = if (workoutStartTime > 0) {
            val seconds = (System.currentTimeMillis() - workoutStartTime) / 1000
            String.format("%02d:%02d", seconds / 60, seconds % 60)
        } else "00:00"
        
        return NotificationCompat.Builder(context, NOTIFICATION_CHANNEL_ID)
            .setContentTitle("Workout in Progress")
            .setContentText("❤️ ${currentHeartRate} BPM | 🔥 ${totalCalories} cal | 👟 ${totalSteps} steps | ⏱️ $duration")
            .setSmallIcon(android.R.drawable.ic_media_play)
            .setContentIntent(pendingIntent)
            .setOngoing(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .build()
    }
}
