import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genres_models.dart';
import 'package:app_filmes/services/genres/genres_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final _message = Rxn<MessageModel>();
  final genres = <GenresModels>[].obs;
  MoviesController({required GenresService gerenService})
      : _genresService = gerenService;

  //List<GenresModels> get genres => _genres;
  @override
  void onInit() {
    super.onInit();
    messagerListiner(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genres = await _genresService.getGenres();
      this.genres.assignAll(genres);
    } catch (e) {
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar Categorias'));
    }
  }
}
