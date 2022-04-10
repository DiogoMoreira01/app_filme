import 'package:app_filmes/application/ui/widgets/movies_card.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesGroup extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;
  const MoviesGroup({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              //fontFamily: 'Metropolis'
            ),
          ),
          SizedBox(
            height: 260,
            child: Obx(() => ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MoviesCard(movie: movies[index],);
                })),
          )
        ],
      ),
    );
  }
}
