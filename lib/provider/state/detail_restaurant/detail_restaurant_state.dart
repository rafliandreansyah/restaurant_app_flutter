import 'package:restaurant_app/data/model/response/restaurant_detail_response.dart';

sealed class DetailRestaurantState {}

class DetailRestaurantNoneState extends DetailRestaurantState {}

class DetailRestaurantLoadingState extends DetailRestaurantState {}

class DetailRestaurantErrorState extends DetailRestaurantState {
  final String error;
  DetailRestaurantErrorState({required this.error});
}

class DetailRestaurantSuccessState extends DetailRestaurantState {
  final Restaurant restaurant;
  DetailRestaurantSuccessState({required this.restaurant});
}
