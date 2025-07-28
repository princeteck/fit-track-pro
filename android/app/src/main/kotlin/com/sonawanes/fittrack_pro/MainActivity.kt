package com.sonawanes.fittrack_pro

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.sonawanes.fittrack_pro/sensors"
    private lateinit var sensorService: SensorService

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        sensorService = SensorService(this)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startHeartRateMonitoring" -> {
                    try {
                        sensorService.startHeartRateMonitoring()
                        result.success(null)
                    } catch (e: Exception) {
                        result.error("UNAVAILABLE", "Heart rate monitoring not available", null)
                    }
                }
                "stopHeartRateMonitoring" -> {
                    try {
                        sensorService.stopHeartRateMonitoring()
                        result.success(null)
                    } catch (e: Exception) {
                        result.error("UNAVAILABLE", "Failed to stop heart rate monitoring", null)
                    }
                }
                "getHeartRateReading" -> {
                    try {
                        val heartRate = sensorService.getHeartRateReading()
                        result.success(heartRate)
                    } catch (e: Exception) {
                        result.error("UNAVAILABLE", "Heart rate reading not available", null)
                    }
                }
                "startWorkoutTracking" -> {
                    try {
                        sensorService.startWorkoutTracking()
                        result.success(null)
                    } catch (e: Exception) {
                        result.error("UNAVAILABLE", "Workout tracking not available", null)
                    }
                }
                "stopWorkoutTracking" -> {
                    try {
                        sensorService.stopWorkoutTracking()
                        result.success(null)
                    } catch (e: Exception) {
                        result.error("UNAVAILABLE", "Failed to stop workout tracking", null)
                    }
                }
                "getWorkoutData" -> {
                    try {
                        val workoutData = sensorService.getWorkoutData()
                        result.success(workoutData)
                    } catch (e: Exception) {
                        result.error("UNAVAILABLE", "Workout data not available", null)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
