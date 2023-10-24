import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieflix/services/api_service.dart';

import '../models/movie_detail_model.dart';
import '../widgets/poster_card_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, posterPath;
  final int id, widgetId;

  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.posterPath,
    required this.widgetId,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;

  @override
  void initState() {
    movie = ApiService.getDetailMovie(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 145,
          leading: Row(
            children: [
              const SizedBox(width: 5),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text("Back to list", style: TextStyle(fontSize: 18))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(widget.title,
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 10),
                PosterCard(
                  id: widget.id,
                  posterPath: widget.posterPath,
                  widgetId: widget.widgetId,
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                    future: movie,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const Text("...");
                      return Column(
                        children: [
                          RatingBar.builder(
                            initialRating: snapshot.data!.voteAverage / 2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(snapshot.data!.genres.join(", ")),
                              ),
                              Text(
                                  "Adult: ${snapshot.data!.adult ? "Yes" : "No"}"),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(snapshot.data!.overview),
                        ],
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
