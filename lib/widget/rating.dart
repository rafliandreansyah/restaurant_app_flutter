import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final bool ignoreGestures;
  const Rating({
    super.key,
    this.ignoreGestures = false,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: ignoreGestures,
      itemSize: 12,
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
