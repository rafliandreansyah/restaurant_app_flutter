import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hint;
  final bool isEnabled;
  const SearchTextField({
    super.key,
    this.textEditingController,
    this.isEnabled = true,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: isEnabled,
      controller: textEditingController,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
          letterSpacing: 0.5,
        ),
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 1,
        ),
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: Colors.grey[400],
          size: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              50,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              50,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              50,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              50,
            ),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
      ),
    );
  }
}
