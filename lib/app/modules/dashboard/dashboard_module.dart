import 'package:flutter_modular/flutter_modular.dart';
import 'dashboard_page.dart';

//ignore: public_member_api_docs
class DashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DashboardPage()),
      ];

//ignore: public_member_api_docs
  static Inject get to => Inject<DashboardModule>.of();
}
