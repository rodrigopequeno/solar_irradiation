import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:solar_irradiation/app/view/horizontal_plane/horizontal_plane_page.dart';

main() {
  testWidgets('HorizontalPlanePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HorizontalPlanePage()));
    final titleFinder = find.text('HorizontalPlane');
    expect(titleFinder, findsOneWidget);
    Container();
  });
}
