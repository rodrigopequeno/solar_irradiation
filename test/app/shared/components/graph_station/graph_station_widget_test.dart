import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:solar_irradiation/app/shared/components/graph_station/graph_station_widget.dart';

main() {
  testWidgets('GraphStationWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(GraphStationWidget()));
    final textFinder = find.text('GraphStation');
    expect(textFinder, findsOneWidget);
    Container();
  });
}
