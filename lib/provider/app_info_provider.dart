// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class AppInfoProvider extends ChangeNotifier {
  String _version = "UNKNOWN";
  String _buildNumber = "UNKNOWN";
  String get version => _version;
  String get buildNumber => _buildNumber;

  saveVersion({required String version, required String buildNumber}) {
    _version = version;
    _buildNumber = buildNumber;
  }
}
