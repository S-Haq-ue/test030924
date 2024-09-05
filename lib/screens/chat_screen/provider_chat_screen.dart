import 'package:flutter/material.dart';

class ChatScreenProvider extends ChangeNotifier {
  ChatScreenProvider() {
    _scrollController = ScrollController();
    _scrollController.addListener(_isScrollsendFunction);
  }
  late ScrollController _scrollController;
  bool _isScrollsEnd = false;

  ScrollController get scrollController => _scrollController;
  bool get isScrollsEnd => _isScrollsEnd;

  void _isScrollsendFunction() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _isScrollsEnd = true;
    } else {
      _isScrollsEnd = false;
    }
    notifyListeners();
  }
}
