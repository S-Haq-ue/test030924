// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:togen_test/screens/flash_card/provider_flash_card.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 164, 13, 238),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Obvio",
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
              textScaler: const TextScaler.linear(2),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Bootstrap.volume_up,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "ob.wi.o",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: const [
                  BoxShadow(blurRadius: 2, offset: Offset(0, 0),),
                ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Consumer<ProviderFlashCard>(builder: (context, flashCardProvider, child) {
                    return IconButton(
                        onPressed: () {
                          flashCardProvider.buttonCarouselController
                              .nextPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
                        },
                        icon: const Icon(
                          Bootstrap.chevron_right,
                        ));
                  }),
                ))
          ],
        ),
      ),
    );
  }
}
