import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genres_models.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/services/genres/genres_service.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final _message = Rxn<MessageModel>();
  final genres = <GenresModels>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovie = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  final gerensSelected = Rxn<GenresModels>();
  MoviesController(
      {required GenresService gerenService,
      required MoviesService moviesService})
      : _genresService = gerenService,
        _moviesService = moviesService;

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
      final genresData = await _genresService.getGenres();
      genres.assignAll(genresData);

      final popularMoviesData = await _moviesService.getPopularMovies();
      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;
      final topRatedMoviesData = await _moviesService.getTopRated();
      topRatedMovie.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = topRatedMoviesData;
    } catch (e, s) {
      print('Erro $e');
      print('Erro $s');
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao carregar dado da pagina'));
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });
      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMovie.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovie.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterMovieByGenre(GenresModels? gerenModel) {
    var genreFilter = gerenModel;

    if (genreFilter?.id == gerensSelected.value?.id) {
      genreFilter = null;
    }
    gerensSelected.value = genreFilter;

    if(genreFilter != null){
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });
      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMovie.assignAll(newTopRatedMovies);
    } else{
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovie.assignAll(_topRatedMoviesOriginal);
    }
  }
}
