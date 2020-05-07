import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_controller.dart';
import '../../shared/components/about/about_widget.dart';
import '../../shared/utils/option_menu.dart';
import '../../view/horizontal_plane/horizontal_plane_page.dart';
import '../../view/inclined_plane/inclined_plane_page.dart';

/// Page responsible for viewing graphs and tables with all
/// the information for the selected point.
class DashboardPage extends StatefulWidget {
  //ignore: public_member_api_docs
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;
  static final AppController controller = Modular.get();

  @override
  void initState() {
    if (controller.currentCoordinate == null) {
      controller.loadFromDisk();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _showDialog,
      child: Scaffold(
          appBar: AppBar(
            title: Observer(builder: (_) {
              if (controller.state == null || controller.city == null) {
                return Text("Carregando...");
              }
              return Text(
                controller.getTitle(),
              );
            }),
            centerTitle: true,
            actions: <Widget>[
              PopupMenuButton<OptionMenu>(
                onSelected: _menuActionIsSelected,
                itemBuilder: (context) {
                  return OptionMenu.values.map((e) {
                    return PopupMenuItem<OptionMenu>(
                      value: e,
                      child: Text(_titleMenu(e)),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          bottomNavigationBar: _bottomNavigationBar(),
          body: Observer(builder: (_) {
            if (controller.currentCoordinate == null ||
                controller.locales == null) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
            }
            final widgetsOptions = [
              HorizontalPlanePage(
                coordinate: controller.currentCoordinate,
                locales: controller.locales,
              ),
              InclinedPlanePage(
                locales: controller.locales,
              )
            ];
            return widgetsOptions.elementAt(currentIndex);
          })),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      currentIndex: currentIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          title: Text(
            'Plano\nHorizontal',
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call_made, color: Colors.white),
          title: Text(
            'Plano\nInclinado',
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  String _titleMenu(OptionMenu optionMenu) {
    switch (optionMenu) {
      case OptionMenu.refresh:
        return "Atualizar";
      case OptionMenu.changeLocation:
        return "Alterar local";
      case OptionMenu.about:
        return "Sobre";
      default:
        return "Default";
    }
  }

  void _menuActionIsSelected(OptionMenu optionMenu) {
    switch (optionMenu) {
      case OptionMenu.refresh:
        controller.searchCoordinates(
            latitude: controller.currentCoordinate.latitude,
            longitude: controller.currentCoordinate.longitude);
        break;
      case OptionMenu.changeLocation:
        controller.deleteFromDisk();
        Modular.to.pushReplacementNamed('/home');
        break;
      case OptionMenu.about:
        Modular.to.showDialog(builder: (_) {
          return AboutWidget();
        });
        break;
      default:
        break;
    }
  }

  Future<bool> _showDialog() async {
    var pressed = false;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Você realmente deseja sair ?",
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Sim"),
              onPressed: () {
                Modular.to.pop();
                pressed = true;
              },
            ),
            FlatButton(
              child: Text("Não"),
              onPressed: () {
                Modular.to.pop();
                pressed = false;
              },
            ),
          ],
        );
      },
    );
    return pressed;
  }

  void _onItemTapped(int currentIndex) {
    setState(() {
      this.currentIndex = currentIndex;
    });
  }
}
