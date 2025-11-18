import 'dart:ui';
import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showForwardButton;
  final Color textColor;
  final VoidCallback? onForwardPressed;
  final VoidCallback? onBackPressed;        // <-- ADDED

  const BuildAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.showForwardButton = false,
    this.textColor = Colors.white,
    this.onForwardPressed,
    this.onBackPressed,                     // <-- ADDED
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E89FF), Color(0xFF63B3FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            leading: showBackButton
                ? IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded, color: textColor),
                    onPressed: onBackPressed ?? () => Navigator.pop(context), // <-- FIXED
                  )
                : null,
            actions: showForwardButton
                ? [
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios_rounded, color: textColor),
                      onPressed: onForwardPressed ?? () {},
                    ),
                  ]
                : null,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
