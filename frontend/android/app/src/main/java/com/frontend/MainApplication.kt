package com.frontend

import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactHost
import com.facebook.react.ReactApplication
import com.facebook.react.ReactNativeApplicationEntryPoint.loadReactNative
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.embedding.engine.FlutterEngineCache


class MainApplication : Application(), ReactApplication {

  companion object{
    lateinit var flutterEngine: FlutterEngine
  }

  override val reactHost: ReactHost by lazy {
    getDefaultReactHost(
      context = applicationContext,
      packageList =
        PackageList(this).packages.apply {
          // Packages that cannot be autolinked yet can be added manually here, for example:
          add(FlutterPackage())
        },
    )
  }

  override fun onCreate() {
    super.onCreate()

    val engine = FlutterEngine(this)
    engine.dartExecutor.executeDartEntrypoint(
        DartExecutor.DartEntrypoint.createDefault()
    )

    FlutterEngineCache.getInstance().put("flutter_profile_engine", engine)
    FlutterBridgeModule.flutterEngine = engine

    loadReactNative(this)
  }

}


