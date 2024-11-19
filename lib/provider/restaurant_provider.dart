import 'package:flutter/material.dart';
import 'package:restaurant_app/data/source/network/api_client.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiClient apiClient;
  RestaurantProvider({required this.apiClient});
}
