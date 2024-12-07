import 'package:flutter/material.dart';

class UniProductPriceText extends StatelessWidget {
  const UniProductPriceText({
    super.key,
    this.currencySign = "GHc",
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      style: isLarge
          ? Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.bodyLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
