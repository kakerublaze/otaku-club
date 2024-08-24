import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageHelper extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final double opacity;
  final Color? color;

  const ImageHelper({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.opacity = 1.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: _getImageWidget(
        imagePath,
      ),
    );
  }

  Widget _getImageWidget(String path) {
    if (path.endsWith('.svg')) {
      return _getSvgImage(path);
    } else if (path.startsWith('http') ||
        path.startsWith('https') ||
        path.startsWith('www')) {
      // Network Image
      return Image.network(
        path,
        height: height,
        width: width,
        fit: fit,
        color: color,
      );
    } else if (path.startsWith('/')) {
      // File Image (Absolute path)
      return Image.file(
        File(path),
        height: height,
        width: width,
        fit: fit,
        color: color,
      );
    } else {
      // Asset Image
      return Image.asset(
        path,
        height: height,
        width: width,
        fit: fit,
        color: color,
      );
    }
  }

  Widget _getSvgImage(String path) {
    if (path.startsWith('http') ||
        path.startsWith('https') ||
        path.startsWith('www')) {
      // Network SVG
      return SvgPicture.network(
        path,
        height: height,
        width: width,
        fit: fit,
        colorFilter: ColorFilter.mode(
          color ?? Colors.transparent,
          BlendMode.srcIn,
        ),
      );
    } else if (path.startsWith('/')) {
      // File SVG (Absolute path)
      return SvgPicture.file(
        File(path),
        height: height,
        width: width,
        fit: fit,
        colorFilter: ColorFilter.mode(
          color ?? Colors.transparent,
          BlendMode.srcIn,
        ),
      );
    } else {
      // Asset SVG
      return SvgPicture.asset(
        path,
        height: height,
        width: width,
        fit: fit,
        colorFilter: ColorFilter.mode(
          color ?? Colors.transparent,
          BlendMode.srcIn,
        ),
      );
    }
  }
}
