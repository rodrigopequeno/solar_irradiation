import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:solar_irradiation/app/shared/components/graph_station/graph_station_widget.dart';
import 'package:solar_irradiation/app/shared/components/table_stations/table_stations_widget.dart';

import '../../shared/models/coordinate.dart';
import '../../shared/models/locale.dart';

/// Page responsible for viewing the graphs and tables with the data of
/// the horizontal plane of the locations closest to the selected point.
class HorizontalPlanePage extends StatelessWidget {
  /// Coordinate of the selected point.
  final Coordinate coordinate;

  /// List of locations closest to the selected point.
  final List<Locale> locales;
  // ignore: public_member_api_docs
  const HorizontalPlanePage({Key key, this.coordinate, this.locales})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const deltaMapWidth = 0.00002199074074074074;
    const deltaMapHeight = 0.00000888888888888889;
    const heightBoxMap = 90.0;
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: heightBoxMap,
              child: Stack(
                children: <Widget>[
                  FlutterMap(
                    options: MapOptions(
                      center: LatLng(
                          coordinate.latitude + (heightBoxMap * deltaMapHeight),
                          coordinate.longitude - (size.width * deltaMapWidth)),
                      zoom: 14.0,
                      interactive: true,
                    ),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                            width: size.height,
                            height: 54,
                            point: LatLng(
                                coordinate.latitude, coordinate.longitude),
                            builder: (_) => Align(
                              alignment: Alignment.topCenter,
                              child: Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 250,
                    child: ListView(
                      children: <Widget>[
                        Card(
                            child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Localização:',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Latitude: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    """${coordinate.latitude.toStringAsFixed(5)} º""",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Longitude: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    """${coordinate.longitude.toStringAsFixed(5)} º""",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            GraphStationWidget(
              locales: locales,
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
              child: TableStationsWidget(
                locales: locales,
              ),
            )
          ],
        )
      ],
    );
  }
}
