import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/route.dart';
import 'package:restaurant_app/data/source/network/api_client.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/screen/detail_restaurant_screen.dart';
import 'package:restaurant_app/screen/restaurants_screen.dart';
import 'package:restaurant_app/screen/review_screen.dart';
import 'package:restaurant_app/screen/search_screen.dart';
import 'package:restaurant_app/style/font.dart';
import 'package:restaurant_app/style/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final dioConf = configureDio();
  final apiClient = ApiClient(
    dio: dioConf,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantProvider(
            apiClient: apiClient,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

Dio configureDio() {
  final options = BaseOptions(
    baseUrl: 'https://restaurant-api.dicoding.dev',
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 2),
  );

  final dio = Dio(options);
  dio.interceptors.add(PrettyDioLogger());

  return dio;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Inter", "Inter");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Restaurant Finder',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const RestaurantsScreen(),
        searchScreen: (context) => const SearchScreen(),
        detailRestaurantScreen: (context) {
          final restaurantId =
              ModalRoute.of(context)?.settings.arguments as String;
          return DetailRestaurantScreen(
            restaurantId: restaurantId,
          );
        },
        reviewScreen: (context) => const ReviewScreen(),
      },
      builder: EasyLoading.init(),
    );
  }
}
