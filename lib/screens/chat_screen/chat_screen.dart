import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:togen_test/widgets/chat_data.dart';
import 'package:togen_test/data.dart';
import 'package:togen_test/screens/chat_screen/provider_chat_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatScreenProvider(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.cyan[50],
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            title: const Row(
              children: [
                CircleAvatar(
                  maxRadius: 15,
                  minRadius: 10,
                  backgroundColor: Colors.amber,
                  child: Image(
                    image: AssetImage("assets/images/man.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "JOHN DOE",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Online",
                      style: TextStyle(color: Colors.grey),
                      textScaler: TextScaler.linear(0.5),
                    ),
                  ],
                ),
              ],
            ),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Bootstrap.three_dots_vertical,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Consumer<ChatScreenProvider>(builder: (context, chatScreenProvider, child) {
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: ListView.builder(
                          controller: chatScreenProvider.scrollController,
                          itemCount: chatDataList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment:
                                    chatDataList[index].user == 1 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                children: [
                                  if (chatDataList[index].user == 0)
                                    const CircleAvatar(
                                      maxRadius: 15,
                                      minRadius: 10,
                                      backgroundColor: Colors.amber,
                                      child: Image(
                                        image: AssetImage("assets/images/man.png"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  if (chatDataList[index].user == 1) const Spacer(),
                                  ChatContainer(chat: chatDataList[index]),
                                  if (chatDataList[index].user == 1)
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  if (chatDataList[index].user == 1)
                                    const CircleAvatar(
                                      maxRadius: 15,
                                      minRadius: 10,
                                      backgroundColor: Colors.amber,
                                      child: Image(
                                        image: AssetImage("assets/images/man.png"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    if (chatScreenProvider.isScrollsEnd)
                      const SizedBox(
                        height: 100,
                      )
                  ],
                );
              }),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 100,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {},
                      child: const CircleAvatar(
                        maxRadius: double.maxFinite,
                        backgroundColor: Color.fromARGB(255, 164, 13, 238),
                        child: Image(
                          image: AssetImage("assets/images/chat2.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                    bottomNavigationBar: AnimatedBottomNavigationBar(
                      rightCornerRadius: 30,
                      leftCornerRadius: 30,
                      height: 70,
                      icons: const [Bootstrap.keyboard_fill, Bootstrap.chevron_right],
                      activeIndex: 1,
                      gapLocation: GapLocation.center,
                      notchSmoothness: NotchSmoothness.smoothEdge,
                      onTap: (value) {
                        if (value == 0) {
                          SystemChannels.textInput.invokeMethod("TextInput.show");
                          debugPrint("clicked");
                        } else {}
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    super.key,
    required this.chat,
  });

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
          color: chat.user == 0 ? const Color.fromARGB(255, 18, 46, 87) : Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(10),
            bottomRight: chat.user == 0 ? const Radius.circular(20) : const Radius.circular(0),
            topLeft: chat.user == 0 ? const Radius.circular(0) : const Radius.circular(20),
            topRight: const Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          testText,
          style: TextStyle(color: chat.user == 0 ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
