import 'package:flutter/material.dart';

import 'adaptive_settings_view.dart';

void main() {
  runApp(const AdaptiveSettingsApp());
}

class AdaptiveSettingsApp extends StatelessWidget {
  const AdaptiveSettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdaptiveSettingsView(),
    );
  }
}
