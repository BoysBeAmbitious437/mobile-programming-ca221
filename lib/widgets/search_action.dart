import 'package:flutter/material.dart';
import 'package:tugaspertemuan03/resources/dimentions.dart';
import 'package:tugaspertemuan03/resources/colors.dart';

class SearchAction extends StatelessWidget {
  const SearchAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: largeSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(largeSize),
        color: const Color(0xFFF5EDE6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: mediumSize, horizontal: largeSize),
        child: Row(
          children: [
            const Icon(Icons.search, color: primaryColor),
            const SizedBox(width: mediumSize),
            const Expanded(
              child: TextField(
                style: TextStyle(color: secondaryColor),
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
