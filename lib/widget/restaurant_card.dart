import 'package:flutter/material.dart';
import 'package:restaurant_app/core/url.dart';
import 'package:restaurant_app/widget/rating.dart';
import 'package:shimmer_image/shimmer_image.dart';

import '../data/model/response/restaurants_response.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 12,
      ),
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(
                0,
                0,
              ),
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 90,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: Hero(
                tag: restaurant.pictureId ?? '',
                child: ProgressiveImage(
                  width: double.infinity,
                  image: smallResolutionImage(
                    restaurant.pictureId ?? '',
                  ),
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name ?? '',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 2,
              ),
              Wrap(
                children: [
                  Rating(
                    initialRating: restaurant.rating ?? 0,
                    ignoreGestures: true,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${restaurant.rating ?? 0}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                Text(
                  'Open',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiaryFixedDim,
                      ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '|',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                      ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  restaurant.city ?? '',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ]),
            ],
          )
        ],
      ),
    );
  }
}
