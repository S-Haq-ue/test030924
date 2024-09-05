import 'package:flutter/material.dart';
import 'package:togen_test/screens/chat_screen/chat_screen.dart';
import 'package:togen_test/screens/flash_card2/flash_card2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),
      home: const FlashCard2(),
    );
  }
}
