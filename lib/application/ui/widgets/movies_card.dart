import 'package:app_filmes/application/ui/icons/filmes_app_icons_icons.dart';
import 'package:flutter/material.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 148,
      height: 280,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                      'https://br.web.img3.acsta.net/pictures/19/04/03/18/23/2539612.jpg',
                      width: 148,
                      height: 184,
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Coringa',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const Text(
                '2019',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
            ],
          ),
          Positioned(
            bottom: 55,
            right: -7,
            child: Material(
              elevation: 5,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 30,
                child: IconButton(
                    iconSize: 13,
                    onPressed: () {},
                    icon: const Icon(
                      FilmesAppIcons.heart,
                      color: Colors.grey,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
