import 'dart:convert';

class ReviewResponse {
  final bool? error;
  final String? message;
  final List<CustomerReview>? customerReviews;

  ReviewResponse({
    this.error,
    this.message,
    this.customerReviews,
  });

  ReviewResponse copyWith({
    bool? error,
    String? message,
    List<CustomerReview>? customerReviews,
  }) =>
      ReviewResponse(
        error: error ?? this.error,
        message: message ?? this.message,
        customerReviews: customerReviews ?? this.customerReviews,
      );

  factory ReviewResponse.fromJson(String str) =>
      ReviewResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReviewResponse.fromMap(Map<String, dynamic> json) => ReviewResponse(
        error: json["error"],
        message: json["message"],
        customerReviews: json["customerReviews"] == null
            ? []
            : List<CustomerReview>.from(
                json["customerReviews"]!.map((x) => CustomerReview.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "customerReviews": customerReviews == null
            ? []
            : List<dynamic>.from(customerReviews!.map((x) => x.toMap())),
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
