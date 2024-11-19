import 'package:flutter/material.dart';
import 'package:restaurant_app/core/route.dart';
import 'package:restaurant_app/widget/menu_card.dart';
import 'package:restaurant_app/widget/rating.dart';
import 'package:restaurant_app/widget/review_card.dart';
import 'package:restaurant_app/widget/section_title.dart';

class DetailRestaurantScreen extends StatelessWidget {
  const DetailRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=600',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: false,
                elevation: 0,
                expandedHeight: 300,
                backgroundColor: Colors.transparent,
                leading: BackButton(
                  color: Theme.of(context).colorScheme.surfaceBright,
                ),
              ),
              SliverToBoxAdapter(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Material(
                    elevation: 7,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        30,
                      ),
                      topRight: Radius.circular(
                        30,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'MoonBean\'s Coffee',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                      ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_rounded,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Rating(
                                          ignoreGestures: true,
                                          itemSize: 16,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '4.7',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '64,57,342 Reviews',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline,
                                            fontSize: 10,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                width: 1,
                                height: 30,
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_city,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Medan',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              fontSize: 12,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  'Jl. Panglima Sudirman No.21, Embong Kaliasin, Kec. Genteng, Surabaya, Jawa Timur 60271',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        fontSize: 10,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const SectionTitle(
                            title: 'Food Menus',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => MenuCard(
                              menuName: 'Cup Cake',
                            ),
                            itemCount: 5,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const SectionTitle(
                            title: 'Drink Menus',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => MenuCard(
                              menuName: 'Black Coffee',
                              menuIcon: Icons.local_drink_rounded,
                            ),
                            itemCount: 5,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SectionTitle(title: 'Reviews'),
                              Row(
                                children: [
                                  Rating(
                                    ignoreGestures: true,
                                    itemSize: 16,
                                    itemCount: 1,
                                    initialRating: 1,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '4.7',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 200,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => ReviewCard(),
                              itemCount: 5,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 16,
                              ),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).pushNamed(reviewScreen);
                              },
                              label: const Text(
                                'Post Your Review',
                              ),
                              icon: const Icon(
                                Icons.star_border_rounded,
                              ),
                              iconAlignment: IconAlignment.end,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
