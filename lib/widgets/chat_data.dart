import 'dart:convert';

import 'package:togen_test/data.dart';


class ChatModel {
  final String text;
  final int user;
  ChatModel({
    required this.text,
    required this.user,
  });

  ChatModel copyWith({
    String? text,
    int? user,
  }) {
    return ChatModel(
      text: text ?? this.text,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'user': user,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      text: map['text'] as String,
      user: map['user'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatModel(text: $text, user: $user)';

  @override
  bool operator ==(covariant ChatModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.text == text &&
      other.user == user;
  }

  @override
  int get hashCode => text.hashCode ^ user.hashCode;
}

List<ChatModel> chatDataList=
  List.generate(10, (index) => ChatModel(text: testText, user: index%2),);
