import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/repositories/movies/movies_repository.dart';

import './movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesreository;

  MoviesServiceImpl({required MoviesRepository moviesRepository}): 
  _moviesreository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() => _moviesreository.getPopularMovies();
  @override
  Future<List<MovieModel>> getTopRated() => _moviesreository.getTopRated();
}
