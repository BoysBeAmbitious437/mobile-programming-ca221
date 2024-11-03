import 'package:flutter/material.dart';
import 'package:tugaspertemuan03/resources/dimentions.dart';

class SearchItem extends StatelessWidget {
  final int index;

  const SearchItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://picsum.photos/800/600?random=$index'),
        ),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: smallSize,
        horizontal: smallSize,
      ),
      child: AspectRatio(
        aspectRatio: 4 / 3,
      ),
    );
  }
}
