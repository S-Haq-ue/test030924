import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:togen_test/screens/chat_screen/chat_screen.dart';
import 'package:togen_test/screens/flash_card/provider_flash_card.dart';
import 'package:togen_test/screens/flash_card/progress.dart';
import 'package:togen_test/screens/flash_card2/flash_card2.dart';

class FlashCard extends StatelessWidget {
  static const routeName = "/FlashCard";
  const FlashCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderFlashCard(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: ListView(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomOvalBottomBorderClipper(
                      radius: MediaQuery.of(context).size.width * 0.75, MediaQuery.of(context).size.height * 0.25),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.maxFinite,
                    color: const Color.fromARGB(255, 164, 13, 238),
                  ),
                ),
                const Positioned(right: 40, left: 40, bottom: 50, child: LodingBody()),
              ],
            ),
            const CarouselWidgetBody(),
            const SizedBox(
              height: 100,
            ),
            const LowerBody(),
          ],
        ),
      ),
    );
  }
}

class CustomOvalBottomBorderClipper extends CustomClipper<Path> {
  final double radius;
  final double offsetheight;

  CustomOvalBottomBorderClipper(this.offsetheight, {super.reclip, required this.radius});
  @override
  Path getClip(Size size) {
    var path = Path();
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, -offsetheight),
      radius: radius,
    );
    path.addArc(rect, 4 * pi / 3, 5 * pi / 3);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 164, 13, 238),
      child: SafeArea(
        child: Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(AntDesign.left_circle_outline, color: Colors.white),
            ),
            const Center(
                child: Text(
              "Flash Card",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CarouselWidgetBody extends StatelessWidget {
  const CarouselWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderFlashCard>(builder: (context, flashprovider, child) {
      return CarouselSlider(
        items: flashprovider.carouselList,
        carouselController: flashprovider.buttonCarouselController,
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.7,
          clipBehavior: Clip.antiAlias,
          onPageChanged: (index, reason) {
            flashprovider.currentIntex = index;
          },
        ),
      );
    });
  }
}

class LodingBody extends StatelessWidget {
  const LodingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Everyday Phrases",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Spacer(),
        const Progress(currentIndex: 7, segmentCount: 10),
      ],
    );
  }
}

class LowerBody extends StatelessWidget {
  const LowerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(255, 164, 13, 238),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(ChatScreen.routeName);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                "Previous",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(FlashCard2.routeName);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color.fromARGB(255, 164, 13, 238),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              "Next",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
