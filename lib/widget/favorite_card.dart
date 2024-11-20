import 'package:flutter/material.dart';
import 'package:restaurant_app/core/url.dart';
import 'package:restaurant_app/data/model/response/restaurants_response.dart';
import 'package:restaurant_app/widget/rating.dart';
import 'package:shimmer_image/shimmer_image.dart';

class FavoriteCard extends StatelessWidget {
  final Restaurant favoriteRestaurant;
  const FavoriteCard({super.key, required this.favoriteRestaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      height: 235,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(
          10,
        ),
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
              4,
            ),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: ProgressiveImage(
                  width: double.infinity,
                  image: smallResolutionImage(
                    favoriteRestaurant.pictureId ?? '',
                  ),
                  fit: BoxFit.cover,
                  height: 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      favoriteRestaurant.name ?? 'No Name',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Rating(
                      initialRating: favoriteRestaurant.rating ?? 0.0,
                      ignoreGestures: true,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${favoriteRestaurant.rating ?? 0.0}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Open',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiaryFixedDim,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
