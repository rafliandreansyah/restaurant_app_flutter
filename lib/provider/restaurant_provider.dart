import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/request/review_request.dart';
import 'package:restaurant_app/data/model/response/restaurant_detail_response.dart';
import 'package:restaurant_app/data/source/network/api_client.dart';
import 'package:restaurant_app/provider/state/add_review/review_restaurant_state.dart';
import 'package:restaurant_app/provider/state/detail_restaurant/detail_restaurant_state.dart';
import 'package:restaurant_app/provider/state/list_restaurant/list_restaurant_state.dart';
import 'package:restaurant_app/provider/state/search_restaurant/search_restaurant_state.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiClient apiClient;
  RestaurantProvider({required this.apiClient});

  ListRestaurantState _listRestaurantState = ListRestaurantNoneState();
  ListRestaurantState get listRestaurantState => _listRestaurantState;

  DetailRestaurantState _detailRestaurantState = DetailRestaurantNoneState();
  DetailRestaurantState get detailRestaurantState => _detailRestaurantState;

  SearchListRestaurantState _searchListRestaurantState =
      SearchListRestaurantNoneState();
  SearchListRestaurantState get searchListRestaurantState =>
      _searchListRestaurantState;

  ReviewRestaurantState _reviewRestaurantState = ReviewRestaurantNoneState();
  ReviewRestaurantState get reviewRestaurantState => _reviewRestaurantState;

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
          error: 'Failed to fetch detail restaurant');
      notifyListeners();
    }
  }

  Future<void> searchRestaurants(String query) async {
    try {
      if (query.isEmpty) {
        _searchListRestaurantState = SearchListRestaurantNoneState();
        notifyListeners();
        return;
      }

      _searchListRestaurantState = SearchListRestaurantLoadingState();
      notifyListeners();

      final response = await apiClient.searchRestaurants(query);
      if (response.error != null && !response.error!) {
        _searchListRestaurantState = SearchListRestaurantSuccessState(
            restaurants: (response.restaurants ?? []));
      } else {
        _searchListRestaurantState = SearchListRestaurantErrorState(
            error: 'Failed to search restaurants');
      }
      notifyListeners();
    } on Exception catch (_) {
      _searchListRestaurantState =
          SearchListRestaurantErrorState(error: 'Failed to search restaurants');
      notifyListeners();
    }
  }

  void resetStateSearch() {
    _searchListRestaurantState = SearchListRestaurantNoneState();
  }

  void resetStateReview() {
    _reviewRestaurantState = ReviewRestaurantNoneState();
  }

  Future<void> addReview(ReviewRequest reviewRequest) async {
    try {
      _reviewRestaurantState = ReviewRestaurantLoadingState();
      notifyListeners();

      final response = await apiClient.addReview(reviewRequest);
      if (response.error != null && !response.error!) {
        _reviewRestaurantState =
            ReviewRestaurantSuccessState(reviewResponse: (response));
      } else {
        _reviewRestaurantState =
            ReviewRestaurantErrorState(error: 'Failed to search restaurants');
      }
      notifyListeners();
    } on Exception catch (_) {
      _reviewRestaurantState =
          ReviewRestaurantErrorState(error: 'Failed to search restaurants');
      notifyListeners();
    }
  }
}
