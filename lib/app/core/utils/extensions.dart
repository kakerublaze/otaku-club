// OnTap extension
import 'package:flutter/material.dart';

extension OnTapExtension on Widget {
  // Creates a onTap function so don't need to use gesture detector again and again
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}

// Height and WidthBox
extension HeightWidthBoxExtension on num {
  // Creates a SizedBox with the specified height
  Widget get heightBox => SizedBox(height: toDouble());

  // Creates a SizedBox with the specified width
  Widget get widthBox => SizedBox(width: toDouble());
}
