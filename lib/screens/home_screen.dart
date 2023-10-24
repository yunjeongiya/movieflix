import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import '../services/api_service.dart';
import '../widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<MovieModel>> popularMovies =
      ApiService.getMovies(ApiService.popular);
  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getMovies(ApiService.nowPlaying);
  final Future<List<MovieModel>> comingSoonMovies =
      ApiService.getMovies(ApiService.comingSoon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                'Popular Movies',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              makeMovieList(1, popularMovies),
              Text(
                'Now in Cinemas',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              makeMovieList(2, nowPlayingMovies),
              Text(
                'Coming Soon',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              makeMovieList(3, comingSoonMovies),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<MovieModel>> makeMovieList(
      int listId, Future<List<MovieModel>> movieModelList) {
    return FutureBuilder(
      future: movieModelList,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var movieModel = snapshot.data![index];
                return Movie(
                    id: movieModel.id,
                    title: movieModel.title,
                    posterPath: movieModel.posterPath,
                    widgetId: index * 10 + listId);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
