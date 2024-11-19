import 'dart:convert';

class ReviewRequest {
  final String? id;
  final String? name;
  final String? review;

  ReviewRequest({
    this.id,
    this.name,
    this.review,
  });

  ReviewRequest copyWith({
    String? id,
    String? name,
    String? review,
  }) =>
      ReviewRequest(
        id: id ?? this.id,
        name: name ?? this.name,
        review: review ?? this.review,
      );

  factory ReviewRequest.fromJson(String str) =>
      ReviewRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReviewRequest.fromMap(Map<String, dynamic> json) => ReviewRequest(
        id: json["id"],
        name: json["name"],
        review: json["review"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "review": review,
      };
}
