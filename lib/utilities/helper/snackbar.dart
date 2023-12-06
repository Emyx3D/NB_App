import 'package:flutter/material.dart';
import 'package:naijabatternew/utilities/colors.dart';

void showSnackbar(BuildContext context, String title, String msg, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(msg),
        ],
      ),
      backgroundColor: color, // Replace with your desired background color
      duration: const Duration(seconds: 2),
    ),
  );
}

void successSnackbar(BuildContext context, String msg,
    [String title = 'Success']) {
  showSnackbar(context, title, msg, ProjectColors.successColor);
}

void failedSnackbar(BuildContext context, String msg,
    [String title = 'Failed']) {
  showSnackbar(context, title, msg, ProjectColors.errorColor);
}
