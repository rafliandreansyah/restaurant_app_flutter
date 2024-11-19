import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _nameController = TextEditingController();
  final _descReviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Review'),
      ),
      body: Padding(
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
                onPressed: () {},
                child: const Text(
                  'Send Review',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
