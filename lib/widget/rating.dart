import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final bool ignoreGestures;
  final double itemSize;
  final int itemCount;
  final double initialRating;
  const Rating({
    super.key,
    this.ignoreGestures = false,
    this.itemSize = 12,
    this.itemCount = 5,
    this.initialRating = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      itemCount: itemCount,
      ignoreGestures: ignoreGestures,
      itemSize: itemSize,
      itemPadding: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amberAccent,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
