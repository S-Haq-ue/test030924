import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class FlashCard extends StatelessWidget {
  const FlashCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 164, 13, 238),
          leading: IconButton(onPressed: () {
            
          }, icon: const Icon(Bootstrap.chevron_left)),
        ),
        body: const Center(
          child: Text("Flash Card"),
        ),
    );
  }
}

