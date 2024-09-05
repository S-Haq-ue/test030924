import 'dart:convert';

class CardModel {
  final String title;
  final String subtitle;
  CardModel({
    required this.title,
    required this.subtitle,
  });

  CardModel copyWith({
    String? title,
    String? subtitle,
  }) {
    return CardModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) => CardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CardModel(title: $title, subtitle: $subtitle)';

  @override
  bool operator ==(covariant CardModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.subtitle == subtitle;
  }

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode;
}