import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:togen_test/carousel_widget.dart';

class ProviderFlashCard extends ChangeNotifier {
  final CarouselSliderController _buttonCarouselController = CarouselSliderController();
  int _currentIndex = 0;
  List<CarouselWidget> carouselList = List.generate(
    15,
    (index) => const CarouselWidget(),
  );

  CarouselSliderController get buttonCarouselController => _buttonCarouselController;
  int get currentIntex => _currentIndex;

  set currentIntex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
