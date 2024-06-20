import 'package:flutter/material.dart';

import 'curver_edges.dart';

class ECruvedEdgesWidget extends StatelessWidget {
  const ECruvedEdgesWidget({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: ECustomCurveEdge(),
        child: child
    );
  }
}