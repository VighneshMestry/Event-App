// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

// Event eventFromJson(String str) => Event.fromJson(json.decode(str));

// String eventToJson(Event data) => json.encode(data.toJson());

class Event {
    String title;
    String backgroundImage;
    String description;
    String location;
    String duration;
    String punchLine1;
    String punchLine2;
    List<String> galleryImage;
    String category;

    Event({
        required this.title,
        required this.backgroundImage,
        required this.description,
        required this.location,
        required this.duration,
        required this.punchLine1,
        required this.punchLine2,
        required this.galleryImage,
        required this.category,
    });

    Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backgroundImage': backgroundImage,
      'description': description,
      'location': location,
      'duration': duration,
      'punchLine1': punchLine1,
      'punchLine2': punchLine2,
      'galleryImage': galleryImage,
      'category': category,
    };
  }

    factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      title: map['title'] ?? '',
      backgroundImage: map['backgroundImage'] ?? '',
      description: map['description'],
      location: map['location'],
      duration: map['duration'] ?? '',
      punchLine1: map['punchLine1'],
      punchLine2: map['punchLine2'],
      galleryImage:  List<String>.from(map['galleryImage']),
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());
  

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source));
}
