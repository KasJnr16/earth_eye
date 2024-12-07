import 'package:flutter/material.dart';

class UniProductTitleText extends StatelessWidget {
  const UniProductTitleText(
      {super.key,
      required this.title,
      this.isSmallSize = false,
      this.maxLines = 2,
      this.textAlign = TextAlign.left});

  final String title;
  final bool isSmallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final displayTitle = title.isNotEmpty ? title : 'No Title Available';
    return Text(
      displayTitle,
      style: isSmallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleLarge,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
