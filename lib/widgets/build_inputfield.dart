import 'package:flutter/material.dart';

class BuildInputField extends StatefulWidget {
  final String? label;
  final String hintText;
  final String? prefixText;
  final bool number;
  final bool obscureText;
  final Icon? icon;
  final bool active;
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;

  const BuildInputField({
    super.key,
    this.label,
    required this.hintText,
    this.prefixText,
    this.number = false,
    this.obscureText = false,
    this.icon,
    this.active = true,
    this.inputController,
    this.onChanged,
  });

  @override
  State<BuildInputField> createState() => _BuildInputFieldState();
}

class _BuildInputFieldState extends State<BuildInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.active ? const Color(0xFFF0F0F0) : Colors.grey.shade300,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: const TextStyle(
                color: Color.fromARGB(221, 34, 34, 34),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: TextField(
              enabled: widget.active,
              controller: widget.inputController,
              onChanged: widget.onChanged,
              keyboardType: widget.number
                  ? TextInputType.number
                  : TextInputType.text,
              obscureText: _obscureText,
              decoration: InputDecoration(
                filled: false,
                fillColor: Colors.transparent,
                prefixIcon: widget.icon != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                        child: Icon(
                          widget.icon!.icon,
                          color: const Color.fromARGB(221, 34, 34, 34),
                          size: widget.icon!.size ?? 24,
                        ),
                      )
                    : null,
                prefixText:
                    widget.prefixText != null ? '${widget.prefixText}  ' : null,
                prefixStyle: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Colors.black38,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 0.0,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                suffixIcon: widget.obscureText
                    ? IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
              ),
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
