package com.frontend

import android.os.Handler
import android.os.Looper

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine



class FlutterBridgeModule(reactContext: ReactApplicationContext) :
    ReactContextBaseJavaModule(reactContext) {

    companion object {
        var flutterEngine: FlutterEngine? = null
    }

    override fun getName(): String = "FlutterBridge"

    @ReactMethod
    fun setUserId(userId: Int) {
        val mainHandler = Handler(Looper.getMainLooper())
        mainHandler.post {
            flutterEngine?.let { engine ->
                val channel = MethodChannel(engine.dartExecutor.binaryMessenger, "flutter_profile_channel")
                channel.invokeMethod("setUserId", userId)
            }
        }
    }

}
