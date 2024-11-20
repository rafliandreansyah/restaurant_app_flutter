import 'package:restaurant_app/data/model/response/restaurants_response.dart';

sealed class ListRestaurantState {}

class ListRestaurantNoneState extends ListRestaurantState {}

class ListRestaurantLoadingState extends ListRestaurantState {}

class ListRestaurantErrorState extends ListRestaurantState {
  final String error;
  ListRestaurantErrorState({required this.error});
}

class ListRestaurantSuccessState extends ListRestaurantState {
  final List<Restaurant> restaurants;
  ListRestaurantSuccessState({required this.restaurants});
}
