import 'package:flutter/material.dart';

class DualToggleButton extends StatelessWidget {
  final String leftText;
  final String rightText;
  final bool isLeftSelected;
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;
  

  const DualToggleButton({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.isLeftSelected,
    required this.onLeftTap,
    required this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          _buildTab(
            text: leftText,
            isSelected: isLeftSelected,
            onTap: onLeftTap,
          ),
          _buildTab(
            text: rightText,
            isSelected: !isLeftSelected,
            onTap: onRightTap,
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
