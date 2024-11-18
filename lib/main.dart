import 'package:flutter/material.dart';
import 'package:restaurant_app/core/route.dart';
import 'package:restaurant_app/screen/detail_restaurant_screen.dart';
import 'package:restaurant_app/screen/restaurants_screen.dart';
import 'package:restaurant_app/screen/search_screen.dart';
import 'package:restaurant_app/style/font.dart';
import 'package:restaurant_app/style/theme.dart';

void main() {
  runApp(const MyApp());
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
        detailRestaurantScreen: (context) => const DetailRestaurantScreen(),
      },
    );
  }
}
