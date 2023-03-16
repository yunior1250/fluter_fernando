
import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreenScreen extends StatelessWidget {


 

  @override
  Widget build(BuildContext context) {

  final moviesProvider = Provider.of<MoviesProvider>(context );
  //print(moviesProvider.onDisplayMovies);

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas'),
        elevation: 0,
        actions: [
          IconButton(
             icon:Icon(Icons.search),
            onPressed:()=>showSearch(
              context: context,
               delegate: MovieSearchDelegate()
               ),
             ),
        ],

      ),


      body:SingleChildScrollView(child: Column(
        children: [
          //cardSwiper //tarjetas principales
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          //listado horizontal /de peliculas
          MovieSlider(
            movies : moviesProvider.popularMovies,
            title: 'Populares',
            onNexPage: ()=>moviesProvider.getPopularMovies()

          ),
       
          


        ],
      ),
      )
    );
  }
}
