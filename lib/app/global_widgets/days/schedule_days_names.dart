import 'package:flutter/material.dart';

Widget buildCustomTab(String day) {
  // Split the day into two parts: e.g., "MON" and "DAY"
  String upperPart = day.substring(0, 3).toUpperCase();
  String lowerPart = "DAY";

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    child: Container(
      width: 80, // Adjust size to your preference
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:
            Border.all(color: Colors.blueAccent, width: 2), // Circular border
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            upperPart,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          Text(
            lowerPart,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    ),
  );
}
