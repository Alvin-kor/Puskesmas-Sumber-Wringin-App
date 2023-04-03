import 'package:flutter/material.dart';

class CustomCardSection extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  const CustomCardSection(
      {super.key, required this.icon, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                minimumSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.2)),
            onPressed: () {},
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                size: 30.0,
              ),
              const SizedBox(width: 10.0),
              Text(
                placeholder,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
            ])));
  }
}
