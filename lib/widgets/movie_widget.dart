import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';
import 'package:movieflix/widgets/poster_card_widget.dart';

class Movie extends StatelessWidget {
  final String title, posterPath;
  final int id, widgetId;

  const Movie({
    super.key,
    required this.id,
    required this.title,
    required this.posterPath,
    required this.widgetId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
                id: id,
                title: title,
                posterPath: posterPath,
                widgetId: widgetId),
          ),
        );
      },
      child: Column(
        children: [
          PosterCard(
            id: id,
            posterPath: posterPath,
            widgetId: widgetId,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
