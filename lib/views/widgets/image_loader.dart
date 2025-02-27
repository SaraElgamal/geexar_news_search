import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geexar/core/constants/app_colors.dart';
import 'package:geexar/core/constants/app_icons.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoader extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double width;
  final BoxFit fit;
  final double borderRadius;

  const ImageLoader({
    super.key,
    required this.imageUrl,
    this.height = 150,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) => _buildShimmerEffect(),
        errorWidget: (context, url, error) => _buildErrorImage(),
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        color: Colors.grey[300],
      ),
    );
  }

  Widget _buildErrorImage() {
    return Container(
      height: height,
      width: width,
      color: AppColors.darkGrey,
      child: const Icon(AppIcons.errorImage, color: AppColors.red, size: 50),
    );
  }
}
