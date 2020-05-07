import 'package:flutter/material.dart';

import '../../models/locale.dart';
import '../../models/solar_irradiation_data.dart';
import '../../utils/constants.dart';

/// Widget responsible for displaying the table with the solar radiation data
/// from the horizontal plane, angle equal to latitude, highest annual average
/// and highest monthly minimum of a location.
// ignore: must_be_immutable
class TableInclinationWidget extends StatelessWidget {
  //ignore: public_member_api_docs
  final Locale locale;
  //ignore: public_member_api_docs
  List<SolarIrradiationData> solarIrradiationData;
  //ignore: public_member_api_docs
  TableInclinationWidget({Key key, this.locale}) : super(key: key) {
    solarIrradiationData = [locale.horizontalPlaneData];
    List<SolarIrradiationData> listInclined = locale.inclinedPlaneData;
    solarIrradiationData.addAll(listInclined);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(fontSize: 13, fontWeight: FontWeight.w400);
    var kTableColumn = columnTableInformation.entries
        .map((value) => DataColumn(
            label: Text(
              value.key,
              style: textStyle,
            ),
            tooltip: value.value))
        .toList();

    TextStyle _compare(double value, double max, double min) {
      if (value == max) {
        return textStyle.copyWith(
          color: Colors.green[800],
          fontWeight: FontWeight.bold,
        );
      }
      if (value == min) {
        return textStyle.copyWith(
          color: Colors.red[700],
          fontWeight: FontWeight.bold,
        );
      }
      return textStyle;
    }

    var kTableCells = solarIrradiationData.map((data) {
      var latitudeDirection = data.angle > 0 ? "N" : "S";
      var dataCells = <DataCell>[
        DataCell(Text(
          data.title,
          style: textStyle,
        )),
        DataCell(Text(
          "${data.angle}º $latitudeDirection",
          style: textStyle,
        )),
      ];
      dataCells.addAll(data.monthValues
          .map((e) => DataCell(Text(
                e.toStringAsFixed(2),
                style: _compare(e, data.maximum, data.minimum),
              )))
          .toList());
      dataCells.addAll([
        DataCell(Text(
          data.average.toStringAsFixed(2),
          style: textStyle,
        )),
        DataCell(Text(
          data.delta.toStringAsFixed(2),
          style: textStyle,
        )),
      ]);

      return dataCells;
    }).toList();

    var kTableRow = kTableCells.map((e) => DataRow(cells: e)).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: kTableColumn, rows: kTableRow),
    );
  }
}
