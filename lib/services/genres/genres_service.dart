import 'package:app_filmes/models/genres_models.dart';

abstract class GenresService {
  Future<List<GenresModels>> getGenres();
}
