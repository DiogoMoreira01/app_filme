import 'package:app_filmes/application/modules/module.dart';
import 'package:app_filmes/modules/splash/splash_bindings.dart';
import 'package:app_filmes/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings(),
    )
  ];
}
