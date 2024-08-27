import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/constants/app_images.dart';
import 'package:shimmer/shimmer.dart';

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
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _getShimmerPlaceholder();
        },
        errorBuilder: (context, error, stackTrace) {
          return _getErrorImage();
        },
      );
    } else if (path.startsWith('/')) {
      // File Image (Absolute path)
      return Image.file(
        File(path),
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) {
          return _getErrorImage();
        },
      );
    } else {
      // Asset Image
      return Image.asset(
        path,
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) {
          return _getErrorImage();
        },
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
        placeholderBuilder: (context) => _getShimmerPlaceholder(),
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
        placeholderBuilder: (context) => _getShimmerPlaceholder(),
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
        placeholderBuilder: (context) => _getShimmerPlaceholder(),
      );
    }
  }

  Widget _getShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[600]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }

  Widget _getErrorImage() {
    return AppImages.brokenImageIcon != ''
        ? Image.asset(
            AppImages.brokenImageIcon,
            height: height,
            width: width,
            fit: fit,
            color: AppColor.white,
          )
        : const Icon(
            Icons.error,
            size: 50,
            color: AppColor.white,
          );
  }
}
