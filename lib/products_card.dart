import 'package:flutter/material.dart';

class ProductCards extends StatelessWidget {
  const ProductCards({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.backgroundColor,
  });
  final String title;
  final double price;
  final String imagePath;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5.0),
          Text(
            '\$$price',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 5.0),
          Center(
            child: Image.asset(
              imagePath,
              height: 250.0,
            ),
          ),
        ],
      ),
    );
  }
}
