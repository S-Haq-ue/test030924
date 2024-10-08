import 'package:flutter/material.dart';
import 'package:togen_test/screens/chat_screen/chat_screen.dart';
import 'package:togen_test/screens/flash_card/flash_card.dart';
import 'package:togen_test/screens/flash_card2/flash_card2.dart';
// import 'package:togen_test/screens/chat_screen/chat_screen.dart';
// import 'package:togen_test/screens/flash_card2/flash_card2.dart';
import 'package:togen_test/screens/plan_screen/plan_screen.dart';
// import 'package:togen_test/screens/plan_screen/plan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),
      home: const ChatScreen(),
      routes: {
        ChatScreen.routeName: (ctx)=>const ChatScreen(),
        FlashCard.routeName: (ctx)=>const FlashCard(),
        FlashCard2.routeName: (ctx)=>const FlashCard2(),
        PlanScreen.routeName: (ctx)=>const PlanScreen(),
      },
    );
  }
}
