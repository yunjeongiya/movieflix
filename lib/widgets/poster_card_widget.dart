import 'package:flutter/material.dart';

class PosterCard extends StatelessWidget {
  final int id, widgetId;
  final String posterPath;
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  const PosterCard(
      {super.key,
      required this.id,
      required this.posterPath,
      required this.widgetId});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widgetId,
      child: Container(
        width: 150,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.network("$imageBaseUrl/$posterPath"),
      ),
    );
  }
}
