import 'package:flutter/material.dart';
import 'package:solar_irradiation/app/shared/components/graph_inclination/graph_inclination_widget.dart';
import 'package:solar_irradiation/app/shared/components/table_inclination/table_inclination_widget.dart';
import '../../shared/models/locale.dart';

///Page responsible for viewing the graphs and tables with the data of
///the inclined plane of the locations closest to the selected point.
class InclinedPlanePage extends StatelessWidget {
  /// List of locations closest to the selected point.
  final List<Locale> locales;
  // ignore: public_member_api_docs
  const InclinedPlanePage({Key key, @required this.locales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: locales.map(_inclinedPlane).toList(),
        )
      ],
    );
  }

  Widget _inclinedPlane(Locale locale) {
    return Column(
      children: <Widget>[
        Container(
          child: GraphInclinationWidget(
            locale: locale,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: Colors.black.withOpacity(0.4), width: 1.0),
                bottom: BorderSide(
                    color: Colors.white.withOpacity(0.4), width: 1.0),
              ),
            ),
          ),
        ),
        Container(
          child: TableInclinationWidget(
            locale: locale,
          ),
        ),
      ],
    );
  }
}
