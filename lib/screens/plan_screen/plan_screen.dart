import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 250,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 164, 13, 238),
                      Color.fromARGB(255, 227, 180, 250),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UPGRADE",
                        style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Unlock premium features and take your English skills to the next level.",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Chip(
                              label: Text(
                                "Basic",
                                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.white),
                          const SizedBox(
                            width: 10,
                          ),
                          Chip(
                              label: Text(
                                "Gold",
                                style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: const Color.fromARGB(255, 227, 180, 250)),
                          const SizedBox(
                            width: 10,
                          ),
                          Chip(
                              label: Text(
                                "Platinum",
                                style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: const Color.fromARGB(255, 227, 180, 250))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 210,
            right: 30,
            left: 30,
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 255, 230, 122), width: 2),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: Column(
                children: [
                  ClipPath(
                    clipper: CustomMultiplePointedEdgeClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 230, 122),
                      ),
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Text(
                              "BASIC",
                              style:
                                  GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Spacer(),
                            const Text(
                              "₹",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " 4500",
                              style:
                                  GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BulletPoints(
                    title:
                        "Self-paced learning - I am self-motivated and disciplined to learn by myself through recorded lessons.",
                    style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const BulletPoints(
                    title: "Recorded Lessons by Aparna (6-month validity).",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const BulletPoints(
                    title:
                        "AI-powered speech/pronunciation practice is available for 2 weeks with an option to extend with an additional add-on subscription.",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PlanDescription(
                    blackText: "Anyone can add on more time with Ai features.",
                    yellowText: "Rs. 300/ month.",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const PlanDescription(
                    blackText: "The difference is basic only has",
                    yellowText: "2 weeks free vs. Gold",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color.fromARGB(255, 219, 219, 219)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        "₹",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " 4500",
                        style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Text(
                    "For 3 Months Plan",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 164, 13, 238),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text(
                    "Buy Now",
                    style: GoogleFonts.poppins(fontSize: 15),
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

class PlanDescription extends StatelessWidget {
  final String blackText;
  final String yellowText;
  const PlanDescription({
    super.key,
    required this.blackText,
    required this.yellowText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SizedBox(
        width: 270,
        child: Column(
          children: [
            RichText(
              text: TextSpan(text: blackText, style: GoogleFonts.poppins(color: Colors.black), children: [
                TextSpan(
                  text: yellowText,
                  style: GoogleFonts.poppins(color: Colors.amberAccent),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPoints extends StatelessWidget {
  final String title;
  final TextStyle? style;
  const BulletPoints({
    super.key,
    required this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                child: CustomPaint(
                  size: const Size(15, 15),
                  painter: BulletPoint(),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 270,
            child: Text(
              title,
              style: style ?? GoogleFonts.poppins(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromARGB(255, 164, 13, 238), Color.fromARGB(255, 227, 180, 250)])),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                Bootstrap.x_circle_fill,
                color: Colors.grey[50],
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}

class CustomMultiplePointedEdgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    var curXPos = 0.0;
    var curYPos = size.height + 10;
    var increment = size.width / 50;
    while (curXPos < size.width) {
      curXPos += increment;
      curYPos = curYPos == size.height ? size.height - 10 : size.height;
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BulletPoint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);

    final Paint segmentPaint = Paint()
      ..color = const Color.fromARGB(255, 164, 13, 238)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      0.0,
      2 * pi,
      false,
      segmentPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
