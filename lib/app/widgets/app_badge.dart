import 'package:flutter/material.dart';
import 'package:jala_verification/app/utils/colors.dart';

class AppBadge extends StatelessWidget {
  final String text;
  final Color? color, textColor;
  const AppBadge({super.key, required this.text, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color ?? primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: textColor ?? whiteColor,
        ),
      ),
    );
  }
}