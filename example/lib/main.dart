
import 'package:example/presentation/page/profile_page.dart';
import 'package:example/presentation/state/user_state_riverprod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final container = ProviderContainer();

void main() => runApp( MyApp());


class MyApp extends StatelessWidget {
  MyApp({super.key});
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TextField(
              controller: _textController,
            ),
            UncontrolledProviderScope(container: container, child: ProfileFrame()),
            TextButton(
              child: Text("Send id"),
              onPressed: (){
                container.read(trackedUserId.notifier).state = int.parse(_textController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}