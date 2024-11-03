import 'package:flutter/material.dart';
import 'package:tugaspertemuan03/widgets/search_item.dart';
import 'package:tugaspertemuan03/resources/dimentions.dart';
import 'package:tugaspertemuan03/widgets/search_action.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchAction(),

        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 3,
            ),
            padding: const EdgeInsets.all(largeSize),
            itemBuilder: (context, index) => SearchItem(index: index),
            itemCount: 27,
          ),
        ),
      ],
    );
  }
}
