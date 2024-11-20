import 'package:flutter/material.dart';
import 'package:restaurant_app/data/source/network/api_client.dart';
import 'package:restaurant_app/provider/state/list_restaurant/list_restaurant_state.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiClient apiClient;
  RestaurantProvider({required this.apiClient});

  ListRestaurantState _listRestaurantState = ListRestaurantNoneState();

  ListRestaurantState get listRestaurantState => _listRestaurantState;

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
}
