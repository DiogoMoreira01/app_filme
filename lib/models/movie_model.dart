import 'dart:convert';

class MovieModel {
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final List<int> genres;
  final bool favorite;
  MovieModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.posterPath,
    required this.genres,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'release_date': releaseDate});
    result.addAll({'poster_path': posterPath});
    result.addAll({'genre_ids': genres});
    result.addAll({'favorite': favorite});

    return result;
  }

/*
 Map<String, dynamic> toMap() {
    return{
  
    'id': id;
    'title': title;
    'release_date': releaseDate;
    'poster_path': posterPath;
    'genre_ids': genres;
    'favorite': favorite;
    }  
    
  }
 */
  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      releaseDate: map['release_date'] ?? '',
      posterPath: 'https://image.tmdb.org/t/p/w200${map['poster_path']}',
      genres: List<int>.from(map['genre_ids']),
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
