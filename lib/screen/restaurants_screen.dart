import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/route.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/provider/state/list_restaurant/list_restaurant_state.dart';
import 'package:restaurant_app/widget/empty.dart';
import 'package:restaurant_app/widget/restaurant_card.dart';
import 'package:restaurant_app/widget/search_text_field.dart';
import 'package:restaurant_app/widget/section_title.dart';
import 'package:restaurant_app/widget/favorite_card.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (mounted) {
        context.read<RestaurantProvider>().getListRestaurants();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 30,
                ),
                child: Column(
                  children: [
                    Text(
                      'Find the best restaurants near you...',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerLow,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(
                              0,
                              5,
                            ),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.of(context).pushNamed(searchScreen),
                        child: const SearchTextField(
                          isEnabled: false,
                          hint: 'Search...',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: Consumer<RestaurantProvider>(
                  builder: (context, value, child) {
                final state = value.listRestaurantState;
                if (state is ListRestaurantLoadingState) {
                  EasyLoading.show(status: 'loading...');
                  return Container();
                } else if (state is ListRestaurantSuccessState) {
                  EasyLoading.dismiss();

                  if (state.restaurants.isEmpty) {
                    return const Expanded(
                      child: Empty(
                        message: 'Restaurant is empty',
                        size: 200,
                      ),
                    );
                  }

                  final favoriteRestaurant = [];

                  if (state.restaurants.length > 5) {
                    final favoriteRestaurantSublist =
                        state.restaurants.sublist(0, 5);
                    for (var data in favoriteRestaurantSublist) {
                      favoriteRestaurant.add(data);
                    }
                  } else {
                    for (var restaurant in state.restaurants) {
                      favoriteRestaurant.add(restaurant);
                    }
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: SectionTitle(title: 'Favourite'),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: Row(
                            children: [
                              for (var i = 0;
                                  i < favoriteRestaurant.length;
                                  i++) ...[
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pushNamed(
                                      detailRestaurantScreen,
                                      arguments:
                                          favoriteRestaurant[i].id ?? ''),
                                  child: FavoriteCard(
                                      favoriteRestaurant:
                                          favoriteRestaurant[i]),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: SectionTitle(title: 'Recommended'),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                              detailRestaurantScreen,
                              arguments: state.restaurants[index].id ?? '',
                            ),
                            child: RestaurantCard(
                                restaurant: state.restaurants[index]),
                          ),
                          itemCount: state.restaurants.length,
                        ),
                      )
                    ],
                  );
                } else if (state is ListRestaurantErrorState) {
                  EasyLoading.dismiss();
                  return Center(
                    child: Text(state.error),
                  );
                } else {
                  EasyLoading.dismiss();
                  return Container();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
