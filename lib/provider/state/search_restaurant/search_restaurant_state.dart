import 'package:restaurant_app/data/model/response/search_restaurants_response.dart';

sealed class SearchListRestaurantState {}

class SearchListRestaurantNoneState extends SearchListRestaurantState {}

class SearchListRestaurantLoadingState extends SearchListRestaurantState {}

class SearchListRestaurantErrorState extends SearchListRestaurantState {
  final String error;
  SearchListRestaurantErrorState({required this.error});
}

class SearchListRestaurantSuccessState extends SearchListRestaurantState {
  final List<Restaurant> restaurants;
  SearchListRestaurantSuccessState({required this.restaurants});
}
