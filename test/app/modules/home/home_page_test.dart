import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:solar_irradiation/app/app_module.dart';
import 'package:solar_irradiation/app/modules/home/home_module.dart';

import 'package:solar_irradiation/app/modules/home/home_page.dart';

void main() {
  initModules([HomeModule(), AppModule()]);
  group('widget visibility', () {
    testWidgets('display soon during the splash screen', (tester) async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      final logoWidget = find.byType(SvgPicture);
      expect(logoWidget, findsOneWidget);
    });
    testWidgets('display text "Encontre o melhor ângulo para seu painel solar"',
        (tester) async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      final textWidget =
          find.text('Encontre o melhor ângulo para seu painel solar');
      expect(textWidget, findsOneWidget);
    });
    testWidgets(
        'display current location and search buttons based on state and city',
        (tester) async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      final buttonsWidgets = find.byType(RaisedButton);
      expect(buttonsWidgets, findsNWidgets(2));
    });
    testWidgets('display fields for entering state and city', (tester) async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      final fieldsWidgets = find.byType(TextField);
      expect(fieldsWidgets, findsNWidgets(2));
    });
  });
}
