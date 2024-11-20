import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/data/model/request/review_request.dart';
import 'package:restaurant_app/data/model/response/restaurant_detail_response.dart';
import 'package:restaurant_app/data/model/response/restaurants_response.dart';
import 'package:restaurant_app/data/model/response/review_response.dart';
import 'package:restaurant_app/data/model/response/search_restaurants_response.dart';

class ApiClient {
  final Dio dio;
  final logger = Logger();
  ApiClient({required this.dio});

  FutureOr<RestaurantsResponse> getRestaurants() async {
    try {
      final response = await dio.get('/list');
      return RestaurantsResponse.fromMap(response.data);
    } on DioException catch (e, stackhttp) {
      logger.e(e.toString(), stackTrace: stackhttp);
      if (e.response != null) {
        try {
          return RestaurantsResponse.fromJson(e.response?.data);
        } catch (e, stack) {
          logger.e(e.toString(), stackTrace: stack);
          throw Exception('Failed to fetch restaurants');
        }
      } else {
        throw Exception('Failed to fetch restaurants');
      }
    } catch (e, stack) {
      logger.e(e.toString(), stackTrace: stack);
      throw Exception('Failed to fetch restaurants');
    }
  }

  FutureOr<RestaurantDetailResponse> getRestaurantDetail(
      String restaurantId) async {
    try {
      final response = await dio.get('/detail/$restaurantId');
      return RestaurantDetailResponse.fromJson(response.data);
    } on DioException catch (e, stackhttp) {
      logger.e(e.toString(), stackTrace: stackhttp);
      if (e.response != null) {
        try {
          return RestaurantDetailResponse.fromJson(e.response?.data);
        } catch (e, stack) {
          logger.e(e.toString(), stackTrace: stack);
          throw Exception('Failed to fetch detail restaurant');
        }
      } else {
        throw Exception('Failed to fetch detail restaurant');
      }
    } catch (e, stack) {
      logger.e(e.toString(), stackTrace: stack);
      throw Exception('Failed to fetch detail restaurant');
    }
  }

  FutureOr<SearchRestaurantsResponse> searchRestaurants(String query) async {
    try {
      final response = await dio.get('/search', queryParameters: {'q': query});
      return SearchRestaurantsResponse.fromJson(response.data);
    } on DioException catch (e, stackhttp) {
      logger.e(e.toString(), stackTrace: stackhttp);
      if (e.response != null) {
        try {
          return SearchRestaurantsResponse.fromJson(e.response?.data);
        } catch (e, stack) {
          logger.e(e.toString(), stackTrace: stack);
          throw Exception('Failed to search restaurants');
        }
      } else {
        throw Exception('Failed to search restaurants');
      }
    } catch (e, stack) {
      logger.e(e.toString(), stackTrace: stack);
      throw Exception('Failed to search restaurants');
    }
  }

  FutureOr<ReviewResponse> addReview(ReviewRequest reviewRequest) async {
    try {
      final response = await dio.post('/review', data: reviewRequest.toMap());
      return ReviewResponse.fromJson(
        response.data,
      );
    } on DioException catch (e, stackhttp) {
      logger.e(e.toString(), stackTrace: stackhttp);
      if (e.response != null) {
        try {
          return ReviewResponse.fromJson(e.response?.data);
        } catch (e, stack) {
          logger.e(e.toString(), stackTrace: stack);
          throw Exception('Failed to add review restaurant');
        }
      } else {
        throw Exception('Failed to add review restaurant');
      }
    } catch (e, stack) {
      logger.e(e.toString(), stackTrace: stack);
      throw Exception('Failed to add review restaurant');
    }
  }
}
