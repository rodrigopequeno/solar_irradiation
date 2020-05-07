import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:solar_irradiation/app/shared/components/graph_inclination/graph_inclination_widget.dart';

main() {
  testWidgets('GraphInclinationWidget has message',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(GraphInclinationWidget()));
    final textFinder = find.text('GraphInclination');
    expect(textFinder, findsOneWidget);
    Container();
  });
}
