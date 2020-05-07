import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:solar_irradiation/app/shared/components/table_inclination/table_inclination_widget.dart';

main() {
  testWidgets('TableInclinationWidget has message',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(TableInclinationWidget()));
    final textFinder = find.text('TableInclination');
    expect(textFinder, findsOneWidget);
    Container();
  });
}
