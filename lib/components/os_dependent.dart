import 'dart:io' show Platform;
import 'package:flutter/material.dart';

class TopSpacing extends StatelessWidget {
  const TopSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return const SizedBox(height: 13);
    } else if (Platform.isIOS) {
      return const SizedBox(height: 5);
    }
    return const SizedBox();
  }
}
