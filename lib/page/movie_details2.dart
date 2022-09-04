import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../model/movie_model.dart';
import '../utils/constrant.dart';

class MovieDetailsPage2 extends StatefulWidget {
  static const String routeName = '/movie_details2';
  const MovieDetailsPage2({Key? key}) : super(key: key);

  @override
  State<MovieDetailsPage2> createState() => _MovieDetailsPageState2();
}

class _MovieDetailsPageState2 extends State<MovieDetailsPage2> {
  late Movies movieM;
  bool isF = false, isAdd = false;

  @override
  void didChangeDependencies() {
    movieM = ModalRoute.of(context)!.settings.arguments as Movies;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          SizedBox(
            height: size.height * 0.4,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.4 - 50,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(50)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(movieM.largeCoverImage!))),
                ),
                const Positioned(
                    top: 120,
                    left: 50,
                    right: 50,
                    child: Icon(Icons.video_collection,size: 60,color: Colors.grey,)),
                Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: 80,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
                                blurRadius: 50,
                                color: const Color(0xFF121530).withOpacity(0.2))
                          ],
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 35,
                                color: Colors.amber,
                              ),
                              Text(
                                movieM.rating.toString(),
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  !isF
                                      ? Icons.star_border_purple500_outlined
                                      : Icons.star,
                                  size: 40,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isF = !isF;
                                  });
                                },

                                //color: Colors.amber,
                              ),
                              const Text(
                                'Rate This',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              isAdd
                                  ? IconButton(
                                      icon: const Icon(Icons.add_box,
                                          size: 40, color: Colors.redAccent),
                                      onPressed: () {
                                        setState(() {
                                          isAdd = !isAdd;
                                        });
                                      },

                                      //color: Colors.amber,
                                    )
                                  : IconButton(
                                      icon: const Icon(Icons.add_box,
                                          size: 40, color: Colors.grey),
                                      onPressed: () {
                                        setState(() {
                                          isAdd = !isAdd;
                                        });
                                      },

                                      //color: Colors.amber,
                                    ),
                              const Text(
                                'Add List',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  "${movieM.titleLong} ",
                  style: kDetailScreenBoldTitle,
                ),
              ),
              const SizedBox(height: 1),
              SizedBox(height: 3),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: movieM.genres!.isNotEmpty?Row(
                    children:movieM.genres!.map((e) {
                    return  Chip(backgroundColor: Colors.grey.shade700,
                      label: Text(e,style: TextStyle(color: Colors.white),),

                      );
                    }).toList()
                  ):Text(''),
                ),
              ),
              SizedBox(height: 7),
            ],
          ),
          if (movieM.summary != "")
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 3, vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(3),
                      child: Text('Storyline',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 2, left: 2, top: 3, bottom: 4),
                        child: Text(
                          movieM.summary!,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
