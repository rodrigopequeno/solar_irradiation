import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import '../../models/locale.dart';
import '../../utils/constants.dart';

/// Widget responsible for displaying the graph of solar radiation
/// from the horizontal plane, angle equal to latitude, highest annual average
/// and highest monthly minimum of a location.
class GraphInclinationWidget extends StatelessWidget {
  //ignore: public_member_api_docs
  final Locale locale;
  //ignore: public_member_api_docs
  final DateTime dateNow = DateTime.now();
  //ignore: public_member_api_docs
  GraphInclinationWidget({Key key, this.locale}) : super(key: key);

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

    List<BezierLine> _toGraphLines() {
      const label = 'kWh/m2.dia';
      var countMonth = 0;
      _incrementMonth() {
        return countMonth++ % 12;
      }

      return [
        BezierLine(
          lineColor: linesGraph[0],
          label: label,
          onMissingValue: (dateTime) {
            return locale.horizontalPlaneData.monthValues[dateTime.month - 1];
          },
          data: locale.horizontalPlaneData.monthValues
              .map((e) => DataPoint<DateTime>(
                  value: double.parse(e.toStringAsFixed(2)),
                  xAxis: DateTime(dateNow.year, _incrementMonth() + 1)))
              .toList(),
        ),
        BezierLine(
          lineColor: linesGraph[1],
          label: label,
          onMissingValue: (dateTime) {
            return locale.horizontalPlaneData.monthValues[dateTime.month - 1];
          },
          data: locale.inclinedPlaneData[0].monthValues
              .map((e) => DataPoint<DateTime>(
                  value: double.parse(e.toStringAsFixed(2)),
                  xAxis: DateTime(dateNow.year, _incrementMonth() + 1)))
              .toList(),
        ),
        BezierLine(
          lineColor: linesGraph[2],
          label: label,
          onMissingValue: (dateTime) {
            return locale.horizontalPlaneData.monthValues[dateTime.month - 1];
          },
          data: locale.inclinedPlaneData[1].monthValues
              .map((e) => DataPoint<DateTime>(
                  value: double.parse(e.toStringAsFixed(2)),
                  xAxis: DateTime(dateNow.year, _incrementMonth() + 1)))
              .toList(),
        ),
        BezierLine(
          lineColor: linesGraph[3],
          label: label,
          onMissingValue: (dateTime) {
            return locale.horizontalPlaneData.monthValues[dateTime.month - 1];
          },
          data: locale.inclinedPlaneData[2].monthValues
              .map((e) => DataPoint<DateTime>(
                  value: double.parse(e.toStringAsFixed(2)),
                  xAxis: DateTime(dateNow.year, _incrementMonth() + 1)))
              .toList(),
        ),
      ];
    }

    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: 1),
                ]),
            alignment: Alignment.center,
            child: Text(
              'Irradiação Solar no Plano Inclinado em\n${locale.station}',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: BezierChart(
              footerDateTimeBuilder: (dateTime, bezierChartScale) {
                return months[dateTime.month - 1];
              },
              footerValueBuilder: (value) => value.toString(),
              bezierChartScale: BezierChartScale.MONTHLY,
              fromDate: fromDate,
              toDate: toDate,
              series: _toGraphLines(),
              config: graphConfig,
            ),
          ),
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
                      itemCount: subtitlesGraphInclination.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return subtitle(linesGraph[index],
                            subtitlesGraphInclination[index]);
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
