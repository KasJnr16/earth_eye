import 'package:flutter/material.dart';

class UniCircularLoader extends StatelessWidget {
  const UniCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:
          CircularProgressIndicator(), // Correct instantiation of CircularProgressIndicator
    );
  }
}
