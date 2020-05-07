import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/dashboard/dashboard_module.dart';
import 'modules/home/home_module.dart';
import 'repositories/app_repository.dart';
import 'view/splash_screen/splash_screen_page.dart';

//ignore: public_member_api_docs
class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppRepository(i.get())),
        Bind((i) => Dio()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashScreenPage()),
        Router('/home', module: HomeModule()),
        Router('/dashboard', module: DashboardModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  //ignore: public_member_api_docs
  static Inject get to => Inject<AppModule>.of();
}
