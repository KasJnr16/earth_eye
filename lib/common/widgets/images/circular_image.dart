import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:earth_eye_web/common/widgets/shimmers/shimmer.dart';
import 'package:earth_eye_web/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';

class UniCircularImage extends StatelessWidget {
  const UniCircularImage({
    super.key,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = UniSizes.sm,
    this.fit = BoxFit.cover,
    this.image,
    this.file,
    required this.imageType,
    this.memoryImage,
  });

  final BoxFit? fit;
  final String? image;
  final File? file;
  final ImageType imageType;
  final Uint8List? memoryImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.white),
        borderRadius: BorderRadius.circular(width >= height ? width : height),
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
        borderRadius: BorderRadius.circular(width >= height ? width : height),
        child: imageWidget);
  }

  Widget _buildAssetImage() {
    if (image != null) {
      return Image(image: AssetImage(image!), color: overlayColor, fit: fit);
    } else {
      return Container();
    }
  }

  Widget _buildFileImage() {
    if (file != null) {
      return Image(image: FileImage(file!), color: overlayColor, fit: fit);
    } else {
      return Container();
    }
  }

  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      return Image(
          image: MemoryImage(memoryImage!), color: overlayColor, fit: fit);
    } else {
      return Container();
    }
  }

  Widget _buildNetworkImage() {
    if (image != null) {
      return CachedNetworkImage(
        imageUrl: image!,
        fit: fit,
        color: overlayColor,
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
