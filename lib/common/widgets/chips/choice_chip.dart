import 'package:earth_eye_web/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter/material.dart';
import 'package:earth_eye_web/utils/constants/colors.dart';
import 'package:earth_eye_web/utils/helpers/helper_functions.dart';

class UniChoiceChip extends StatelessWidget {
  const UniChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = HelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelPadding: isColor ? EdgeInsets.zero : null,
        padding: isColor ? EdgeInsets.zero : null,
        labelStyle: TextStyle(color: selected ? UniColors.white : null),
        avatar: isColor
            ? UniCircularContainer(
                width: 35,
                height: 35,
                backgroundColor: HelperFunctions.getColor(text)!)
            : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? HelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
