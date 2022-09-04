import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../model/movie_model.dart';
import '../utils/constrant.dart';

class MovieDetailsPage extends StatefulWidget {
  static const String routeName = '/movie_details';
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late Movies movieM;
  bool isF = false;
  @override
  void didChangeDependencies() {
    movieM = ModalRoute.of(context)!.settings.arguments as Movies;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //(stars == null)
          // ?const Center(child: CircularProgressIndicator(),)
          CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            shadowColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            automaticallyImplyLeading: false,
            snap: false,
            floating: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 3),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isF = !isF;
                    });
                  },
                  icon: Icon((isF)
                      ? Icons.bookmark_sharp
                      : Icons.bookmark_border_sharp),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(kDetailsScreenTitleText),
              background: SafeArea(
                child: Hero(
                  tag: movieM.largeCoverImage!,
                  child: CachedNetworkImage(
                    height: 100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SafeArea(
                      child: SizedBox(
                          height: 40,
                          child: Stack(
                            children: const [
                              Center(
                                child: Icon(
                                  Icons.videocam,
                                  size: 40.0,
                                  color: kAppBarColor, // ?? Colors.transparent,
                                ),
                              ),
                              SpinKitRing(
                                color: kAppBarColor, //?? Colors.transparent,
                                size: 50.0,
                                lineWidth: 2.0,
                              ),
                            ],
                          )),
                    ),
                    imageUrl: movieM.largeCoverImage!,
                    errorWidget: (context, url, error) => SafeArea(
                      child: SizedBox(
                          height: 40,
                          child: Stack(
                            children: const [
                              Center(
                                child: Icon(
                                  Icons.videocam,
                                  size: 40.0,
                                  color: kAppBarColor, // ?? Colors.transparent,
                                ),
                              ),
                              SpinKitRing(
                                color: kAppBarColor, //?? Colors.transparent,
                                size: 50.0,
                                lineWidth: 2.0,
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Wrap(
                        children: [
                          Text(
                            "${movieM.title} ",
                            style: kDetailScreenBoldTitle,
                          ),
                          Text(
                            (movieM.year == "") ? "" : "(${movieM.year})",
                            style: kDetailScreenRegularTitle,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: // if(movieM.rating != 0)
                          Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          Text(
                            movieM.rating.toString(),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.amber),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Text(movieM.genres!.first),
                      ),
                    ),
                    SizedBox(height: 1),
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
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(kStoryLineTitleText,
                                style: kSmallTitleTextStyle),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 1, left: 1, top: 1, bottom: 4),
                              child: Text(
                                movieM.summary!,
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xFFC9C9C9)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
