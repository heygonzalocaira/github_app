import 'package:flutter/material.dart';
import 'package:fulltimeforce_challenge/utils/colors.dart';

class LanguageStatusWidget extends StatelessWidget {
  const LanguageStatusWidget({
    required this.language,
    required this.currentLanguage,
    required this.label,
    required this.onPressed,
    super.key,
  });
  final String language;
  final String currentLanguage;
  final String label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final languagesMatch = language == currentLanguage;

    final borderColor =
        languagesMatch ? AppColors.darkGreen : AppColors.softGrey;
    final icon =
        languagesMatch ? Icons.check_circle_rounded : Icons.circle_outlined;

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Icon(
                icon,
                color: borderColor,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
