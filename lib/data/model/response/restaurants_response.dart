import 'dart:convert';

class RestaurantsResponse {
  final bool? error;
  final String? message;
  final int? count;
  final List<Restaurant>? restaurants;

  RestaurantsResponse({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  RestaurantsResponse copyWith({
    bool? error,
    String? message,
    int? count,
    List<Restaurant>? restaurants,
  }) =>
      RestaurantsResponse(
        error: error ?? this.error,
        message: message ?? this.message,
        count: count ?? this.count,
        restaurants: restaurants ?? this.restaurants,
      );

  factory RestaurantsResponse.fromJson(String str) =>
      RestaurantsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantsResponse.fromMap(Map<String, dynamic> json) =>
      RestaurantsResponse(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: json["restaurants"] == null
            ? []
            : List<Restaurant>.from(
                json["restaurants"]!.map((x) => Restaurant.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": restaurants == null
            ? []
            : List<dynamic>.from(restaurants!.map((x) => x.toMap())),
      };
}

class Restaurant {
  final String? id;
  final String? name;
  final String? description;
  final String? pictureId;
  final String? city;
  final double? rating;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  Restaurant copyWith({
    String? id,
    String? name,
    String? description,
    String? pictureId,
    String? city,
    double? rating,
  }) =>
      Restaurant(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        pictureId: pictureId ?? this.pictureId,
        city: city ?? this.city,
        rating: rating ?? this.rating,
      );

  factory Restaurant.fromJson(String str) =>
      Restaurant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
