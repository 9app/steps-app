import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:steps_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const StepsApp());

    // Verify that the app displays the welcome message
    expect(find.text('Welcome to Steps Manager!'), findsOneWidget);
    expect(find.text('Your personal step-by-step task organizer'), findsOneWidget);

    // Verify privacy section is displayed
    expect(find.text('Privacy First'), findsOneWidget);
    expect(find.text('All your data stays on your device.\nNo data is sent to external servers.'), findsOneWidget);

    // Verify that the FAB is present
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('FAB shows snackbar when tapped', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const StepsApp());

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the snackbar appears
    expect(find.text('Task creation coming soon!'), findsOneWidget);
  });
}