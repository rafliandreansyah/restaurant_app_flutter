import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/response/restaurant_detail_response.dart';

class ReviewCard extends StatelessWidget {
  final CustomerReview customerReview;
  const ReviewCard(this.customerReview, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxHeight: 180,
            minHeight: 150,
          ),
          width: 250,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.outlineVariant,
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
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(59),
                    child: Image.network(
                      'https://archive.org/download/placeholder-image/placeholder-image.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover, // Replace with your actual image URL
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customerReview.name ?? '',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 16,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        Text(
                          customerReview.date ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                                fontSize: 10,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                customerReview.review ?? '',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                maxLines: 4,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        )
      ],
    );
  }
}
