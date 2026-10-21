import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_adaptativa_flutter/adaptive_settings_view.dart';

void main() {
  testWidgets('muestra los ajustes adaptados a la plataforma', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: AdaptiveSettingsView()),
    );

    expect(find.text('Ajustes'), findsOneWidget);
    expect(find.text('GENERAL'), findsOneWidget);
    expect(find.text('Modo Oscuro'), findsOneWidget);
    expect(find.text('Notificaciones'), findsOneWidget);

    if (Platform.isIOS) {
      expect(find.byType(CupertinoPageScaffold), findsOneWidget);
      expect(find.byType(CupertinoSwitch), findsNWidgets(2));
    } else {
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SwitchListTile), findsNWidgets(2));
    }
  });

  testWidgets('actualiza el estado de los switches en Material', (
    tester,
  ) async {
    if (Platform.isIOS) {
      return;
    }

    await tester.pumpWidget(
      const MaterialApp(home: AdaptiveSettingsView()),
    );

    final darkModeSwitch = tester.widget<SwitchListTile>(
      find.widgetWithText(SwitchListTile, 'Modo Oscuro'),
    );
    expect(darkModeSwitch.value, isFalse);

    await tester.tap(find.text('Modo Oscuro'));
    await tester.pumpAndSettle();

    final updatedDarkModeSwitch = tester.widget<SwitchListTile>(
      find.widgetWithText(SwitchListTile, 'Modo Oscuro'),
    );
    expect(updatedDarkModeSwitch.value, isTrue);
  });
}
