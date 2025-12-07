import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile_module/presentation/state/user_state_riverprod.dart';
import 'package:go_router/go_router.dart'; 
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_profile_module/presentation/page/profile_page.dart';




final container = ProviderContainer();
const _channel = MethodChannel("flutter_profile_channel");



void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _channel.setMethodCallHandler((call) async {
    if (call.method == "setUserId") {
      final int newUserId = call.arguments;
      container.read(trackedUserId.notifier).state = newUserId;
    }
  });

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      initialLocation: "/profile",
      routes: [
        GoRoute(
          path: "/profile",
          builder: (context, state) => Scaffold(
            body: const ProfileFrame(),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
