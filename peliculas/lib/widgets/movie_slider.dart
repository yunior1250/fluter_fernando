import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNexPage;
  const MovieSlider({super.key, required this.movies, this.title, required this.onNexPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final  ScrollController scrollController = new ScrollController();



 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {
      if(scrollController.position.pixels>=scrollController.position.maxScrollExtent-500){
       // print('obtener sigiente pagina');
       widget.onNexPage();
      }
     // print(scrollController.position.pixels);
     // print(scrollController.position.maxScrollExtent);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 265,
        // color: Colors.redAccent.shade400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // si no hay titulo  no debe de mostrar este widget

            if (this.widget.title != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(this.widget.title!,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),

            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movies.length, //length
                  itemBuilder: (_, int index) => _MoviePoster(widget.movies[index],'${widget.title}-${index}-${widget.movies[index].id}')
                  ),
            ),
          ],
        ));
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster(this.movie, this.heroId);
  final Movie movie;
  final String heroId;

  @override
  Widget build(BuildContext context) {

    movie.heroId = heroId  ;



    return Container(
      width: 130,
      height: 190,
      // color: Colors.greenAccent.shade400,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
