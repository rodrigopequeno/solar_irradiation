import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Display a dialog with application information
class AboutWidget extends StatelessWidget {
  // ignore: public_member_api_docs
  const AboutWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Sobre",
        textAlign: TextAlign.center,
      ),
      content: Container(
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                """Aplicativo desenvolvido para ser uma ferramenta que auxilia no cálculo da irradiação solar diária média mensal em cidades brasileiras."""),
            SizedBox(
              height: 10,
            ),
            Text(
              "Base de dados:",
            ),
            InkWell(
                child: Text(
                  'Atlas Brasileiro de Energia Solar - 2ª Edição',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.blue,
                      ),
                ),
                onTap: () =>
                    launch('http://labren.ccst.inpe.br/atlas_2017.html')),
            SizedBox(
              height: 10,
            ),
            Text('Referência:'),
            InkWell(
                child: Text(
                  'SunData 3.0 (2017)',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.blue,
                      ),
                ),
                onTap: () => launch(
                    'http://www.cresesb.cepel.br/index.php?section=sundata')),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Fechar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
