import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveSettingsView extends StatefulWidget {
  const AdaptiveSettingsView({super.key});

  @override
  State<AdaptiveSettingsView> createState() => _AdaptiveSettingsViewState();
}

class _AdaptiveSettingsViewState extends State<AdaptiveSettingsView> {
  bool _darkModeEnabled = false;
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Ajustes'),
        ),
        child: SafeArea(
          child: CupertinoFormSection.insetGrouped(
            header: const Text('GENERAL'),
            children: [
              CupertinoFormRow(
                prefix: const Text('Modo Oscuro'),
                child: CupertinoSwitch(
                  value: _darkModeEnabled,
                  onChanged: (value) {
                    setState(() => _darkModeEnabled = value);
                  },
                ),
              ),
              CupertinoFormRow(
                prefix: const Text('Notificaciones'),
                child: CupertinoSwitch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() => _notificationsEnabled = value);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        elevation: 2,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'GENERAL',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            title: const Text('Modo Oscuro'),
            value: _darkModeEnabled,
            onChanged: (value) {
              setState(() => _darkModeEnabled = value);
            },
          ),
          SwitchListTile(
            title: const Text('Notificaciones'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() => _notificationsEnabled = value);
            },
          ),
        ],
      ),
    );
  }
}
