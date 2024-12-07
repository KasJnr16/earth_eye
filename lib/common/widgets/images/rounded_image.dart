import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:earth_eye_web/common/widgets/shimmers/shimmer.dart';
import 'package:earth_eye_web/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class UniRoundedImage extends StatelessWidget {
  const UniRoundedImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.image,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.padding = UniSizes.sm,
    this.fit = BoxFit.contain,
    this.borderRadius = UniSizes.md,
    this.file,
    this.margin,
    required this.imageType,
    this.overLayColor,
    this.memoryImage,
  });

  final double width, height, padding;
  final double? margin;
  final String? image;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;

  final double borderRadius;
  final File? file;
  final ImageType imageType;
  final Color? overLayColor;
  final Uint8List? memoryImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: border,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: _buildImageWidget(),
    );
  }

  Widget _buildImageWidget() {
    Widget imageWidget;

    switch (imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.asset:
        imageWidget = _buildAssetImage();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemoryImage();
        break;
    }

    //Apply ClipRRect dircetly to the image widget
    return ClipRRect(
        borderRadius: applyImageRadius
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.zero,
        child: imageWidget);
  }

  Widget _buildAssetImage() {
    if (image != null) {
      return Image(image: AssetImage(image!), color: overLayColor, fit: fit);
    } else {
      return Container();
    }
  }

  Widget _buildFileImage() {
    if (file != null) {
      return Image(image: FileImage(file!), color: overLayColor, fit: fit);
    } else {
      return Container();
    }
  }

  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      return Image(
          image: MemoryImage(memoryImage!), color: overLayColor, fit: fit);
    } else {
      return Container();
    }
  }

  Widget _buildNetworkImage() {
    if (image != null) {
      return CachedNetworkImage(
        imageUrl: image!,
        fit: fit,
        color: overLayColor,
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.red,
        ),
        progressIndicatorBuilder: (context, url, progress) =>
            UniShimmerEffect(width: width, height: height),
      );
    } else {
      return Container();
    }
  }
}
