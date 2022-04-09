import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messagerListiner(message);
  }

  //calabool class

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(MessageModel.info(
        title: 'Sucesso',
        message: 'Sucesso ao realizar Login',
      ));
    } catch (e, s) {
      // ignore: avoid_print
      print(' erro: $e');
      // ignore: avoid_print
      print('erro: $s');
      loading(false);
      message(MessageModel.error(title: 'Login Erro', message: e.toString()));
    }
  }
}
