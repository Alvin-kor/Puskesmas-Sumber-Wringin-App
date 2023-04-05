import 'package:flutter/material.dart';

class DetailProgress extends StatelessWidget {
  final String month;
  final String target;
  const DetailProgress({super.key, required this.month, required this.target});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Center(child: Text(month))),
        Container(
          width: 1.0,
          height: 40.0,
          decoration: const BoxDecoration(color: Colors.grey),
        ),
        Expanded(child: Center(child: Text(target)))
      ],
    );
  }
}
