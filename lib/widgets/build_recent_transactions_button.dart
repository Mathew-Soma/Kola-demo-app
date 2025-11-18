import 'package:flutter/material.dart';

class BuildOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const BuildOutlineButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F1FF), // Light blue background
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF80B5FF), // Light blue border
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFF1A73E8), // Blue text color
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Color(0xFF1A73E8), // Same blue as text
            ),
          ],
        ),
      ),
    );
  }
}
