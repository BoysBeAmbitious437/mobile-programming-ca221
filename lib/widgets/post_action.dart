import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostAction extends StatelessWidget {
  const PostAction({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  final String icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
          ),
          onPressed: onTap,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
