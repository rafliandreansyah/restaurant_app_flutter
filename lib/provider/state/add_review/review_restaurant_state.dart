import 'package:restaurant_app/data/model/response/review_response.dart';

sealed class ReviewRestaurantState {}

class ReviewRestaurantNoneState extends ReviewRestaurantState {}

class ReviewRestaurantLoadingState extends ReviewRestaurantState {}

class ReviewRestaurantErrorState extends ReviewRestaurantState {
  final String error;
  ReviewRestaurantErrorState({required this.error});
}

class ReviewRestaurantSuccessState extends ReviewRestaurantState {
  final ReviewResponse reviewResponse;
  ReviewRestaurantSuccessState({required this.reviewResponse});
}
