import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/route.dart';
import 'package:restaurant_app/data/model/response/restaurants_response.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/provider/state/search_restaurant/search_restaurant_state.dart';
import 'package:restaurant_app/widget/restaurant_card.dart';
import 'package:restaurant_app/widget/search_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<RestaurantProvider>().resetStateSearch();
  }

  void _searchRestaurant(value) {
    context.read<RestaurantProvider>().searchRestaurants(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
          ),
          child: Column(
            children: [
              Text(
                'Find your favorite restaurant...',
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
                      color: Theme.of(context).colorScheme.surfaceContainerLow,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(
                        0,
                        5,
                      ),
                    ),
                  ],
                ),
                child: SearchTextField(
                  textEditingController: _controller,
                  hint: 'Search...',
                  textInputAction: TextInputAction.search,
                  onSubmitted: _searchRestaurant,
                ),
              ),
              Expanded(
                child: Consumer<RestaurantProvider>(
                  builder: (context, value, child) {
                    final state = value.searchListRestaurantState;
                    final logger = Logger();
                    logger.e(state);
                    if (state is SearchListRestaurantLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is SearchListRestaurantSuccessState) {
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                        ),
                        itemBuilder: (context, index) {
                          final restaurantSearch = state.restaurants[index];

                          return GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                              detailRestaurantScreen,
                              arguments: restaurantSearch.id,
                            ),
                            child: RestaurantCard(
                              restaurant: Restaurant(
                                id: restaurantSearch.id,
                                name: restaurantSearch.name,
                                rating: restaurantSearch.rating,
                                pictureId: restaurantSearch.pictureId,
                                city: restaurantSearch.city,
                                description: restaurantSearch.description,
                              ),
                            ),
                          );
                        },
                        itemCount: state.restaurants.length,
                      );
                    } else if (state is SearchListRestaurantErrorState) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else if (state is SearchListRestaurantNoneState) {
                      return const Center(
                        child: Text('Please search restaurant do you want!'),
                      );
                    } else {
                      return const Center(
                        child: Text('Please search restaurant do you want!'),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
