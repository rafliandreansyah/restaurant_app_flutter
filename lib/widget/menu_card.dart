import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String menuName;
  final IconData menuIcon;
  const MenuCard(
      {super.key,
      required this.menuName,
      this.menuIcon = Icons.food_bank_outlined});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.outlineVariant,
          )),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.surfaceContainerHighest),
            width: 50,
            height: 50,
            child: Center(
              child: Icon(
                menuIcon,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Text(
              menuName,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
