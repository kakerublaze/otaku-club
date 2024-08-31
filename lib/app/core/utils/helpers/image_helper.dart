import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/constants/app_images.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
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
      return CachedNetworkImage(
        imageUrl: path,
        height: height,
        width: width,
        fit: fit,
        color: color,
        // progressIndicatorBuilder: (context, child, loadingProgress) {
        //   if (loadingProgress.downloaded == loadingProgress.totalSize) return;
        //   return _getShimmerPlaceholder();
        // },
        placeholder: (context, url) => _getShimmerPlaceholder(),
        errorWidget: (context, error, stackTrace) {
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
      baseColor: AppColor.grey800,
      highlightColor: AppColor.grey700,
      child: Container(
        height: height,
        width: width,
        color: AppColor.grey900,
      ),
    );
  }

  Widget _getErrorImage() {
    return AppImages.brokenImageIcon != ''
        ? SizedBox(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    AppImages.brokenImageIcon,
                    height: 40,
                    width: 40,
                    fit: fit,
                    color: AppColor.white,
                  ),
                ),
                5.heightBox,
                const Text(
                  'Image is broken :(',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        : const Icon(
            Icons.error,
            size: 50,
            color: AppColor.white,
          );
  }
}
