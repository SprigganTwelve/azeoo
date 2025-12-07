package com.frontend

import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor



class FlutterProfileViewManager : SimpleViewManager<FlutterView>() {
    override fun getName(): String = "FlutterView"

    override fun createViewInstance(reactContext: ThemedReactContext): FlutterView {
        val flutterView = FlutterView(reactContext)

        val flutterEngine = FlutterEngineCache.getInstance().get("flutter_profile_engine")
            ?: throw IllegalStateException("Flutter engine not initialized!")

        flutterView.attachToFlutterEngine(flutterEngine)

        // update the the ref for the bridge.
        FlutterBridgeModule.flutterEngine = flutterEngine

        return flutterView
    }

}
