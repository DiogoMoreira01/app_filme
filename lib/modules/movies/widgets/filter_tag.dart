import 'package:flutter/material.dart';

import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:app_filmes/models/genres_models.dart';

class FilterTag extends StatelessWidget {
  final GenresModels model;
  final bool selected;
  final VoidCallback onPressed;

  const FilterTag({
    Key? key,
    this.selected = false,
    required this.model,
    required this.onPressed,
  }) : 
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        constraints: const BoxConstraints(minWidth: 100, minHeight: 30),
        decoration: BoxDecoration(
          color: selected ? context.themeRed : Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child:  Align(
          alignment: Alignment.center,
          child: Text(
            model.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
