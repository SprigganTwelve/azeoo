
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/page/profile_page.dart';
import 'package:flutter_app/presentation/state/user_state_riverprod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


final container = ProviderContainer();

void main() => runApp( MyApp());


class MyApp extends StatelessWidget {
  MyApp({super.key});
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      initialLocation: "/profile",
      routes: [
        GoRoute(
          path: "/profile",
          builder: (context, state) =>  Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 75, horizontal: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      hintText: "Search an id",
                      hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(width: 2.5, color: Colors.black54)
                      )
                    ),
                  ),
                  TextButton(
                    child: Text("Send id"),
                    onPressed: (){
                      container.read(trackedUserId.notifier).state = int.parse(_textController.text);
                    },
                  ),
                  ProviderScope( child: ProfileFrame()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: 
       _router,
    );
  }
}