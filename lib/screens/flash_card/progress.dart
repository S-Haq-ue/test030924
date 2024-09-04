import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togen_test/screens/flash_card/provider_flash_card.dart';

class Progress extends StatelessWidget {
  final int currentIndex;
  final int segmentCount;

  const Progress({super.key, required this.currentIndex, required this.segmentCount});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderFlashCard>(builder: (context, flagCard, child) {
      return Stack(children: [
        Center(
          child: CustomPaint(
            size: const Size(90, 90),
            painter: CircleSegmentPainter(
              currentIndex: flagCard.currentIntex,
              segmentCount: flagCard.carouselList.length,
            ),
          ),
        ),
        SizedBox(
          height: 90,
          width: 90,
          child: Center(
            child: Text("${flagCard.currentIntex+1}/${flagCard.carouselList.length}"),
          ),
        ),
      ]);
    });
  }
}

class CircleSegmentPainter extends CustomPainter {
  final int currentIndex;
  final int segmentCount;

  CircleSegmentPainter({required this.currentIndex, required this.segmentCount});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);

    final Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final Paint segmentPaint = Paint()
      ..color = const Color.fromARGB(255, 164, 13, 238)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    final double sweepAngle = (2 * pi) / segmentCount;

    for (int i = 0; i < segmentCount; i++) {
      final startAngle = -pi / 2 + (sweepAngle * i);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - 10),
        startAngle,
        sweepAngle,
        false,
        i <= currentIndex ? segmentPaint : backgroundPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
