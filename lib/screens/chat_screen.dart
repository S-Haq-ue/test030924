import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:togen_test/chat_data.dart';
import 'package:togen_test/data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            ListView.builder(
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
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      const Spacer(),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  SystemChannels.textInput.invokeMethod("TextInput.show");
                                },
                                icon: const Icon(Bootstrap.keyboard_fill),
                              ),
                              IconButton(onPressed: () {}, icon: const Icon(Bootstrap.chevron_right),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: MediaQuery.of(context).size.width*0.42,
                  child: Center(
                    child: FloatingActionButton(
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
                  ),
                ),
              ],
            ),
          ],
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

// class BottomStructure extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Layer 1

//     Paint paintFill0 = Paint()
//       ..color = const Color.fromARGB(255, 255, 255, 255)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width * 0.2
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     Path path_0 = Path();
//     path_0.moveTo(size.width * 0.2925000, size.height * 0.4314286);
//     path_0.lineTo(size.width * 0.2924750, size.height * 0.5690143);
//     path_0.lineTo(size.width * 0.6691667, size.height * 0.5714286);
//     path_0.lineTo(size.width * 0.6675000, size.height * 0.4300000);
//     path_0.lineTo(size.width * 0.5441667, size.height * 0.4314286);
//     path_0.lineTo(size.width * 0.5000750, size.height * 0.5008857);
//     path_0.lineTo(size.width * 0.4587833, size.height * 0.4991429);
//     path_0.lineTo(size.width * 0.4183333, size.height * 0.4300000);
//     path_0.lineTo(size.width * 0.2925000, size.height * 0.4314286);
//     path_0.close();

//     canvas.drawPath(path_0, paintFill0);

//     // Layer 1

//     Paint paintStroke0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     canvas.drawPath(path_0, paintStroke0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
