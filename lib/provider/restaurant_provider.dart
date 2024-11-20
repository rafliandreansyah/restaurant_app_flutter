import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/response/restaurant_detail_response.dart';
import 'package:restaurant_app/data/source/network/api_client.dart';
import 'package:restaurant_app/provider/state/detail_restaurant/detail_restaurant_state.dart';
import 'package:restaurant_app/provider/state/list_restaurant/list_restaurant_state.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiClient apiClient;
  RestaurantProvider({required this.apiClient});

  ListRestaurantState _listRestaurantState = ListRestaurantNoneState();
  ListRestaurantState get listRestaurantState => _listRestaurantState;

  DetailRestaurantState _detailRestaurantState = DetailRestaurantNoneState();
  DetailRestaurantState get detailRestaurantState => _detailRestaurantState;

  Future<void> getListRestaurants() async {
    try {
      _listRestaurantState = ListRestaurantLoadingState();
      notifyListeners();

      final response = await apiClient.getRestaurants();
      if (response.error != null && !response.error!) {
        _listRestaurantState = ListRestaurantSuccessState(
            restaurants: (response.restaurants ?? []));
      } else {
        _listRestaurantState =
            ListRestaurantErrorState(error: response.message ?? '');
      }
      notifyListeners();
    } on Exception catch (_) {
      _listRestaurantState = ListRestaurantErrorState(
          error: 'Failed to fetch list of restaurants');
      notifyListeners();
    }
  }

  Future<void> getDetailRestaurant(String restaurantId) async {
    try {
      _detailRestaurantState = DetailRestaurantLoadingState();
      notifyListeners();

      final response = await apiClient.getRestaurantDetail(restaurantId);
      if (response.error != null && !response.error!) {
        _detailRestaurantState = DetailRestaurantSuccessState(
            restaurant: (response.restaurant ?? Restaurant()));
      } else {
        _detailRestaurantState =
            DetailRestaurantErrorState(error: response.message ?? '');
      }
      notifyListeners();
    } on Exception catch (_) {
      _detailRestaurantState = DetailRestaurantErrorState(
          error: 'Failed to fetch list of restaurants');
      notifyListeners();
    }
  }
}
