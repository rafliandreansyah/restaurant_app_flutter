import 'package:flutter/material.dart';
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
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     padding: const EdgeInsets.symmetric(
              //       vertical: 30,
              //     ),
              //     itemBuilder: (context, index) => RestaurantCard(),
              //     itemCount: 4,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
