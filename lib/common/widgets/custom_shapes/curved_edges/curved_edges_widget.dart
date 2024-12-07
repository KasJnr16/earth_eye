import 'package:earth_eye_web/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';
class UniCurvedEdgeWidget extends StatelessWidget {
  const UniCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: UniCustomeCurvedEdges(), child: child);
  }
}
