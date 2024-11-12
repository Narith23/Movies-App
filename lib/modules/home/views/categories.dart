import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCategoryChip('Action'),
        _buildCategoryChip('Comedy'),
        _buildCategoryChip('Drama'),
        _buildCategoryChip('Horror'),
      ],
    );
  }

  Widget _buildCategoryChip(String category) {
    return Chip(
      label: Text(
        category,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
    );
  }
}
