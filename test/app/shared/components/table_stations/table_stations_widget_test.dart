import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:solar_irradiation/app/shared/components/table_stations/table_stations_widget.dart';

main() {
  testWidgets('TableStationsWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(TableStationsWidget()));
    final textFinder = find.text('TableStations');
    expect(textFinder, findsOneWidget);
    Container();
  });
}
