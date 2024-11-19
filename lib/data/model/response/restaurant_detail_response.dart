import 'dart:convert';

class RestaurantDetailResponse {
  final bool? error;
  final String? message;
  final Restaurant? restaurant;

  RestaurantDetailResponse({
    this.error,
    this.message,
    this.restaurant,
  });

  RestaurantDetailResponse copyWith({
    bool? error,
    String? message,
    Restaurant? restaurant,
  }) =>
      RestaurantDetailResponse(
        error: error ?? this.error,
        message: message ?? this.message,
        restaurant: restaurant ?? this.restaurant,
      );

  factory RestaurantDetailResponse.fromJson(String str) =>
      RestaurantDetailResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantDetailResponse.fromMap(Map<String, dynamic> json) =>
      RestaurantDetailResponse(
        error: json["error"],
        message: json["message"],
        restaurant: json["restaurant"] == null
            ? null
            : Restaurant.fromMap(json["restaurant"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "restaurant": restaurant?.toMap(),
      };
}

class Restaurant {
  final String? id;
  final String? name;
  final String? description;
  final String? city;
  final String? address;
  final String? pictureId;
  final List<Category>? categories;
  final Menus? menus;
  final double? rating;
  final List<CustomerReview>? customerReviews;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.categories,
    this.menus,
    this.rating,
    this.customerReviews,
  });

  Restaurant copyWith({
    String? id,
    String? name,
    String? description,
    String? city,
    String? address,
    String? pictureId,
    List<Category>? categories,
    Menus? menus,
    double? rating,
    List<CustomerReview>? customerReviews,
  }) =>
      Restaurant(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        city: city ?? this.city,
        address: address ?? this.address,
        pictureId: pictureId ?? this.pictureId,
        categories: categories ?? this.categories,
        menus: menus ?? this.menus,
        rating: rating ?? this.rating,
        customerReviews: customerReviews ?? this.customerReviews,
      );

  factory Restaurant.fromJson(String str) =>
      Restaurant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromMap(x))),
        menus: json["menus"] == null ? null : Menus.fromMap(json["menus"]),
        rating: json["rating"]?.toDouble(),
        customerReviews: json["customerReviews"] == null
            ? []
            : List<CustomerReview>.from(
                json["customerReviews"]!.map((x) => CustomerReview.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "menus": menus?.toMap(),
        "rating": rating,
        "customerReviews": customerReviews == null
            ? []
            : List<dynamic>.from(customerReviews!.map((x) => x.toMap())),
      };
}

class Category {
  final String? name;

  Category({
    this.name,
  });

  Category copyWith({
    String? name,
  }) =>
      Category(
        name: name ?? this.name,
      );

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}

class CustomerReview {
  final String? name;
  final String? review;
  final String? date;

  CustomerReview({
    this.name,
    this.review,
    this.date,
  });

  CustomerReview copyWith({
    String? name,
    String? review,
    String? date,
  }) =>
      CustomerReview(
        name: name ?? this.name,
        review: review ?? this.review,
        date: date ?? this.date,
      );

  factory CustomerReview.fromJson(String str) =>
      CustomerReview.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerReview.fromMap(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "review": review,
        "date": date,
      };
}

class Menus {
  final List<Category>? foods;
  final List<Category>? drinks;

  Menus({
    this.foods,
    this.drinks,
  });

  Menus copyWith({
    List<Category>? foods,
    List<Category>? drinks,
  }) =>
      Menus(
        foods: foods ?? this.foods,
        drinks: drinks ?? this.drinks,
      );

  factory Menus.fromJson(String str) => Menus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Menus.fromMap(Map<String, dynamic> json) => Menus(
        foods: json["foods"] == null
            ? []
            : List<Category>.from(
                json["foods"]!.map((x) => Category.fromMap(x))),
        drinks: json["drinks"] == null
            ? []
            : List<Category>.from(
                json["drinks"]!.map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "foods": foods == null
            ? []
            : List<dynamic>.from(foods!.map((x) => x.toMap())),
        "drinks": drinks == null
            ? []
            : List<dynamic>.from(drinks!.map((x) => x.toMap())),
      };
}
