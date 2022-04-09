import 'package:app_filmes/models/genres_models.dart';

abstract class GenresRepository {
  Future<List<GenresModels>> getGenres();
}
