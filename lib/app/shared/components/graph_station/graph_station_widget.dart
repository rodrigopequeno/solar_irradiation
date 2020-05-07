import 'dart:math';

import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

import '../../models/locale.dart';
import '../../utils/constants.dart';

/// Widget responsible for displaying the graph of solar radiation
/// from the horizontal plane of the locations closest to the selected point.
class GraphStationWidget extends StatelessWidget {
  /// List of locations closest to the selected point.
  final List<Locale> locales;
  //ignore: public_member_api_docs
  final DateTime dateNow = DateTime.now();
  //ignore: public_member_api_docs
  GraphStationWidget({Key key, this.locales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fromDate = DateTime(dateNow.year, 1, 1);
    final toDate = DateTime(dateNow.year, 12, 31);

    final graphConfig = BezierChartConfig(
      showDataPoints: true,
      displayLinesXAxis: true,
      bubbleIndicatorColor: Colors.white,
      verticalIndicatorStrokeWidth: 2.0,
      verticalIndicatorColor: Colors.black26,
      showVerticalIndicator: true,
      verticalIndicatorFixedPosition: false,
      pinchZoom: false,
      startYAxisFromNonZeroValue: true,
      verticalLineFullHeight: true,
    );

    final _subtitles = locales.map((locale) {
      if (locale.country.isEmpty) {
        return locale.city;
      }
      if (locale.country != "BRASIL") {
        return locale.country;
      }
      return "${locale.city}/${locale.uf}";
    }).toList();

    List<BezierLine> _toGraphLines() {
      const label = 'kWh/m2.dia';
      var countMonth = 0;
      var countStation = 0;
      _incrementMonth() {
        return ++countMonth;
      }

      _incrementStation() {
        return countStation++;
      }

      return locales.map((locale) {
        countMonth = 0;
        return BezierLine(
          label: label,
          onMissingValue: (dateTime) {
            return locale.horizontalPlaneData.monthValues[dateTime.month - 1];
          },
          lineColor: linesGraph[_incrementStation()],
          data: locale.horizontalPlaneData.monthValues
              .map((e) => DataPoint<DateTime>(
                  value: double.parse(e.toStringAsFixed(2)),
                  xAxis: DateTime(dateNow.year, _incrementMonth())))
              .toList(),
        );
      }).toList();
    }

    DateTime maximumValue() {
      final list = locales
          .map((e) => e.horizontalPlaneData.monthValues
              .indexOf(e.horizontalPlaneData.maximum))
          .toList();
      return DateTime(dateNow.year, list.reduce(max), 1);
    }

    Widget subtitle(Color cor, String subtitle) {
      return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: <Widget>[
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: cor,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            SizedBox(
              width: 5,
            ),
            Text(subtitle, style: Theme.of(context).textTheme.subtitle2),
          ],
        ),
      );
    }

    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            color: Theme.of(context).backgroundColor,
            child: Center(
              child: Text(
                'Irradiação Solar no Plano Horizontal em\nlocais próximos',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          LayoutBuilder(builder: (_, constraint) {
            return Container(
              height: 280,
              child: BezierChart(
                footerDateTimeBuilder: (dateTime, bezierChartScale) {
                  return months[dateTime.month - 1];
                },
                bezierChartScale: BezierChartScale.MONTHLY,
                fromDate: fromDate,
                toDate: toDate,
                selectedDate: maximumValue(),
                series: _toGraphLines(),
                config: graphConfig,
              ),
            );
          }),
          Container(
              color: Theme.of(context).backgroundColor,
              height: 25,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Legenda:',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: _subtitles.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return subtitle(linesGraph[index], _subtitles[index]);
                        }),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
