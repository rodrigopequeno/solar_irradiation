import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:solar_irradiation/app/shared/components/about/about_widget.dart';

main() {
  testWidgets('AboutWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AboutWidget()));
    final textFinder = find.text('About');
    expect(textFinder, findsOneWidget);
    Container();
  });
}
