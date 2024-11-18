import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final bool ignoreGestures;
  final double itemSize;
  const Rating({
    super.key,
    this.ignoreGestures = false,
    this.itemSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
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
