import 'package:app_filmes/application/modules/module.dart';
import 'package:app_filmes/modules/login/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'login_bindings.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: '/loginPage',
      page: () => const LoginPage(),
      binding: LoginBindings(),
    )
  ];
}
