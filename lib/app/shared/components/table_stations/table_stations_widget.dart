import 'package:flutter/material.dart';

import '../../models/locale.dart';
import '../../utils/constants.dart';

/// Widget responsible for displaying the table with the solar radiation data
/// from the horizontal plane of the nearest locations to the selected point.
class TableStationsWidget extends StatelessWidget {
  //ignore: public_member_api_docs
  final List<Locale> locales;
  //ignore: public_member_api_docs
  const TableStationsWidget({Key key, this.locales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(fontSize: 13, fontWeight: FontWeight.w400);

    var kTableColumn = columnTableStations.entries
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

    var kTableCells = locales.map((data) {
      var latitudeDirection = data.latitude > 0 ? "N" : "S";
      var list = <DataCell>[
        DataCell(Text(
          data.station,
          style: textStyle,
        )),
        DataCell(data.uf != ''
            ? Text(
                "${data.city}/${data.uf}",
                style: textStyle,
              )
            : Text(
                data.city,
                style: textStyle,
              )),
        DataCell(Text(
          "${data.latitude}º $latitudeDirection",
          style: textStyle,
        )),
        DataCell(Text(
          "${data.longitude}º O",
          style: textStyle,
        )),
        DataCell(Text(
          "${data.distance.toStringAsFixed(1)} km",
          style: textStyle,
        )),
      ];
      list.addAll(data.horizontalPlaneData.monthValues
          .map((e) => DataCell(Text(
                e.toStringAsFixed(3),
                style: _compare(e, data.horizontalPlaneData.maximum,
                    data.horizontalPlaneData.minimum),
              )))
          .toList());
      list.addAll([
        DataCell(Text(
          data.horizontalPlaneData.average.toStringAsFixed(3),
          style: textStyle,
        )),
        DataCell(Text(
          data.horizontalPlaneData.delta.toStringAsFixed(3),
          style: textStyle,
        )),
      ]);

      return list;
    }).toList();

    var kTableRow = kTableCells.map((e) => DataRow(cells: e)).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: kTableColumn, rows: kTableRow),
    );
  }
}
