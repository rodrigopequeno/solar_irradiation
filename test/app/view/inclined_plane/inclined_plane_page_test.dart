import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:solar_irradiation/app/view/inclined_plane/inclined_plane_page.dart';

main() {
  testWidgets('InclinedPlanePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(InclinedPlanePage(
      locales: [],
    )));
    final titleFinder = find.text('InclinedPlane');
    expect(titleFinder, findsOneWidget);
    Container();
  });
}
