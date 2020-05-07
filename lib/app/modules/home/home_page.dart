import 'package:combos/combos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../shared/components/logo/logo_widget.dart';
import '../../shared/utils/constants.dart';
import 'home_controller.dart';

/// Page responsible for allowing the user to select
/// the location to consult the data.
class HomePage extends StatefulWidget {
  //ignore: public_member_api_docs
  final String title;
  //ignore: public_member_api_docs
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  bool loading = false;
  List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    super.initState();
    controller.loadingDialog = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    controller.loadingDialog.style(
      message: controller.loadingMessage,
      borderRadius: 5.0,
      backgroundColor: Colors.white,
      progressWidget: null,
      elevation: 5.0,
      insetAnimCurve: Curves.easeInOut,
    );
    disposers = [
      reaction(
        (_) => controller.loadingMessage,
        (_) => controller.setLoadingDialogMessage(),
      ),
      reaction(
        (_) => controller.errorMessage,
        (_) => controller.errorMessage == null
            ? ""
            : Fluttertoast.showToast(
                msg: controller.errorMessage,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red[900],
                textColor: Colors.white,
                fontSize: 16.0,
              ),
      )
    ];
  }

  @override
  void dispose() {
    disposers.map((e) => e);
    super.dispose();
  }

  double _withMax(
      {double standard = 0.0, double max = 0.0, double total = 0.0}) {
    if (total > standard && standard < max) {
      return standard;
    }
    if (total > max) {
      return max;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeWidthMax =
        _withMax(standard: (size.width * 0.7), max: 500, total: size.width);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 50, top: 50),
                  child: Hero(
                    tag: 'logo',
                    child: LogoWidget(
                      width: sizeWidthMax * 0.8,
                      height: sizeWidthMax * 0.8,
                    ),
                  ),
                ),
                Container(
                  width: sizeWidthMax,
                  child: Text(
                    'Encontre o melhor ângulo para seu painel solar',
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: Colors.black,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Container(
                      height: 50,
                      width: sizeWidthMax - 32,
                      child: Center(
                        child: Text(
                          'Localização atual',
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await controller.getLocation();
                      controller.errorMessage = null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    width: sizeWidthMax,
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
                Observer(builder: (_) {
                  return _buildTypeaheadCombo(
                    sizeWidthMax,
                    "Estado",
                    controller.state,
                    statesBrasil.keys.toList(),
                    controller.changeState,
                    selected: controller.selectedState,
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return _buildTypeaheadCombo(
                    sizeWidthMax,
                    "Cidade",
                    controller.city,
                    controller.cities,
                    controller.changeCity,
                    loading: controller.loadingCity,
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 50),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: Colors.black,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Container(
                      height: 50,
                      width: _withMax(
                              standard: (size.width * 0.7),
                              max: 500,
                              total: size.width) /
                          2,
                      child: Center(
                        child: Text(
                          'Pesquisar',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await controller.setDataLocale();
                      controller.errorMessage = null;
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTypeaheadCombo(double sizeWidthMax, String hint, String selection,
      List<String> selectionList, onChange(String value),
      {selected(String value), bool loading = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      width: sizeWidthMax,
      height: 60,
      child: Visibility(
        visible: !loading,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: TypeaheadCombo<String>(
          selected: selection,
          onItemTapped: selected,
          getList: (text) async {
            await Future.delayed(const Duration(milliseconds: 200));
            return selectionList
                .where((selection) => selection
                    .toLowerCase()
                    .contains((text.toLowerCase() ?? '').toLowerCase()))
                .toList();
          },
          getItemText: (item) => item,
          onSelectedChanged: onChange,
          itemBuilder: (context, parameters, item, selected, text) {
            return PreferredSize(
                preferredSize: Size(0, 20),
                child: ListTile(
                  selected: selected,
                  title: TypeaheadCombo.markText(
                    item,
                    text,
                    const TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.grey,
                    ),
                  ),
                ));
          },
          decoration: InputDecoration(
            hintText: " $hint",
            focusedBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
          ),
        ),
      ),
    );
  }
}
