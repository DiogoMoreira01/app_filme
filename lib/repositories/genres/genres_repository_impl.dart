import 'package:app_filmes/application/rest_client.dart/rest_client.dart';
import 'package:app_filmes/models/genres_models.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<GenresModels>> getGenres() async {
    final result = await _restClient.get<List<GenresModels>>(
      '/genre/movie/list',
      // ignore: deprecated_member_use
      query:{ 'api_key': RemoteConfig.instance.getString('api_token'),
      'language' : 'pt-br'
      },
      decoder: (data) {
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData
              .map<GenresModels>((g) => GenresModels.fromMap(g))
              .toList();
        }
        return <GenresModels>[];
      },
    );
    if (result.hasError) {
      //print(result.statusText);
      throw Exception('Erro ao buscar Generos');
    }
    return result.body ?? <GenresModels>[];
  }
}
