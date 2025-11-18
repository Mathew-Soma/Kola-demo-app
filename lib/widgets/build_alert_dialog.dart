import 'package:flutter/material.dart';

enum AlertType { success, error }

class BuildAlertDialog extends StatelessWidget {
  final String title;
  final String msg;
  final AlertType type;

  const BuildAlertDialog({
    super.key,
    required this.title,
    required this.msg,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Icon(
            type == AlertType.success ? Icons.check_circle : Icons.error,
            color: type == AlertType.success ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: type == AlertType.success ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
      content: Text(
        msg,
        style: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 30, 29, 29),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "OK",
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
