import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/request/review_request.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/provider/state/add_review/review_restaurant_state.dart';
import 'package:restaurant_app/widget/platform_container.dart';

class ReviewScreen extends StatefulWidget {
  final String restaurantId;
  const ReviewScreen({super.key, required this.restaurantId});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _nameController = TextEditingController();
  final _descReviewController = TextEditingController();

  Future<void> _showInfoDialog(String title, String message, bool isError,
      VoidCallback? callback) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isError
                    ? Theme.of(context).colorScheme.error
                    : Colors.green[600],
              ),
        ),
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14,
              ),
        ),
        actions: [
          TextButton(
            onPressed: callback,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _addReview() {
    if (_nameController.text.isEmpty || _descReviewController.text.isEmpty) {
      _showInfoDialog('Field required', 'Please fill in all fields.', true,
          () => Navigator.of(context).pop());
      return;
    }

    final review = ReviewRequest(
      id: widget.restaurantId,
      name: _nameController.text,
      review: _descReviewController.text,
    );

    context.read<RestaurantProvider>().addReview(review);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Review'),
      ),
      body: PlatformContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 16,
          ),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Your name...',
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _descReviewController,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Reviews...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  labelText: 'Reviews',
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _addReview,
                  child: Consumer<RestaurantProvider>(
                    builder: (_, value, child) {
                      final state = context
                          .watch<RestaurantProvider>()
                          .reviewRestaurantState;
                      if (state is ReviewRestaurantLoadingState) {
                        context.read<RestaurantProvider>().resetStateReview();
                        return const SizedBox(
                          width: 20,
                          height: 20,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is ReviewRestaurantSuccessState) {
                        context.read<RestaurantProvider>().resetStateReview();
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          await _showInfoDialog(
                              'Success',
                              'Congratulations! You successfully add review.',
                              false, () {
                            context
                                .read<RestaurantProvider>()
                                .resetStateReview();
                            Navigator.of(context).pop();
                          });
                          if (context.mounted) {
                            Navigator.of(context).pop('reload');
                          }
                        });
                        return const Text(
                          'Send Review',
                        );
                      } else if (state is ReviewRestaurantErrorState) {
                        context.read<RestaurantProvider>().resetStateReview();
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _showInfoDialog(
                              'Failed Add Review', state.error, true, () {
                            context
                                .read<RestaurantProvider>()
                                .resetStateReview();
                          });
                        });
                        return const Text(
                          'Send Review',
                        );
                      } else {
                        context.read<RestaurantProvider>().resetStateReview();
                        return const Text(
                          'Send Review',
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
