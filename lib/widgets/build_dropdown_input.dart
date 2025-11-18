import 'package:flutter/material.dart';

class BuildDropdownField extends StatelessWidget {
  final IconData? icon;
  final String? value;
  final List<String>? items;
  final Function(String?)? onChanged;

  const BuildDropdownField({
    super.key,
    this.icon,
    this.value,
    this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Color unifiedColor = Colors.black87;

    // FIRST ITEM AS HINT
    final String? defaultHint =
        (items != null && items!.isNotEmpty) ? items!.first : null;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(
                icon,
                size: 24,
                color: unifiedColor,
              ),
            ),

          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String?>(
                value: value,      // shows selected
                isExpanded: true,

                // HINT = FIRST ITEM
                hint: Text(
                  defaultHint ?? "",
                  style: TextStyle(
                    color: unifiedColor,
                    fontSize: 16,
                  ),
                ),

                icon: Icon(
                  Icons.arrow_drop_down,
                  color: unifiedColor,
                ),

                style: TextStyle(
                  fontSize: 16,
                  color: unifiedColor,
                ),

                items: (items ?? []).map(
                  (e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(color: unifiedColor),
                      ),
                    );
                  },
                ).toList(),

                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
