import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_controller.dart';
import '../../shared/components/logo/logo_widget.dart';

/// SplashScreen Page
class SplashScreenPage extends StatefulWidget {
  // ignore: public_member_api_docs
  final String title;
  // ignore: public_member_api_docs
  const SplashScreenPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    final controller = AppController();
    Future.delayed(Duration(seconds: 3)).whenComplete(() async {
      if (await controller.hasData()) {
        Modular.to.pushReplacementNamed('/dashboard');
      } else {
        Modular.to.pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 70,
                  top: 40,
                  right: 40,
                  bottom: 100,
                ),
                child: Hero(
                  tag: 'logo',
                  child: LogoWidget(
                    width: size.width * 0.30,
                    height: size.height * 0.30,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff263238)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
