import 'package:app_filmes/models/genres_models.dart';
import 'package:app_filmes/repositories/genres/genres_repository.dart';

import './genres_service.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;

  GenresServiceImpl(
    {required GenresRepository genresRepository})
    : _genresRepository = genresRepository;

  @override
  Future<List<GenresModels>> getGenres() => _genresRepository.getGenres();
}