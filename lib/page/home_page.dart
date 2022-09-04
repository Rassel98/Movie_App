import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/page/movie_details_page.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:provider/provider.dart';

import '../utils/constrant.dart';
import 'movie_details2.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  late MovieProvider provider;
  bool isFirst = true, isExpand = false;
  int _value=0;
  // int _current = 0;
  @override
  void dispose() {
    textController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (isFirst) {
      provider = Provider.of<MovieProvider>(context);
      provider.getMovieApiData();
      isFirst = false;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: isExpand
            ? AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kAppBarColor,
                shadowColor: Colors.transparent,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: TextField(
                            //enabled: true,
                            controller: textController,
                            //onChanged: (value) {},
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.keyboard_voice),
                              hintText: "Search",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80)),
                              filled: true,
                              fillColor: Colors.grey.shade500,
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        alignment: Alignment.center,
                        width: 80,
                        height: 50,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isExpand = !isExpand;
                            });
                            provider.searchMovieByMovieName(textController.text);
                            textController.clear();
                          },
                          icon: const Icon(Icons.send,
                              size: 30, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kAppBarColor,
                shadowColor: Colors.transparent,
                title: const Center(child: Text('Movie App')),
              ),
        floatingActionButton: !isExpand
            ? FloatingActionButton(
                backgroundColor: kLightGrey,
                onPressed: () {
                  setState(() {
                    isExpand = !isExpand;
                  });
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            : null,
        body: Column(
          children: [
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: searchMovie.length,
                itemBuilder: (context, index) {
                  final movieType = searchMovie[index];
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: ChoiceChip(
                      labelStyle: TextStyle(
                          color: _value == index ? Colors.white : Colors.black),
                      selectedColor: Theme.of(context).primaryColor,
                      label: Text(movieType),
                      selected: _value == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? index : 0;
                        });
                        //provider.searchMovieByGen("Documentary");
                        if ( _value != 0) {
                          provider.searchMovieByGen(movieType);
                        } else if (_value == 0) {
                          provider.getAllMovies();
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            const Divider(
              height: 1,
            ),
            provider.movieData
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4),
                      itemCount: provider.moviesList.length,
                      itemBuilder: (context, index) {
                        final movieM =
                            provider.moviesList[index];
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, MovieDetailsPage2.routeName,
                              arguments: movieM),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Stack(
                              children: [
                                Container(
                                  //height: 30,
                                  // width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.2),
                                      child: CachedNetworkImage(
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    child: Stack(
                                                      children: const [
                                                        Center(
                                                          child: Icon(
                                                            Icons.videocam,
                                                            size: 30.0,
                                                            color:
                                                                kMainPinkColor, // ?? Colors.transparent,
                                                            //color: Colors.transparent,
                                                          ),
                                                        ),
                                                        SpinKitRing(
                                                          //color: Colors.transparent,
                                                          color:
                                                              kMainPinkColor, //?? Colors.transparent,
                                                          size: 50.0,
                                                          lineWidth: 2.0,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                          imageUrl: movieM.largeCoverImage!,
                                          errorWidget: (context, url,
                                                  error) =>
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 20,
                                                    child: Stack(
                                                      children: const [
                                                        Center(
                                                          child: Icon(
                                                            Icons.videocam,
                                                            size: 20.0,
                                                            color:
                                                                kMainPinkColor, // ?? Colors.transparent,
                                                          ),
                                                        ),
                                                        SpinKitRing(
                                                          color:
                                                              kMainPinkColor, // ?? Colors.transparent,
                                                          size: 50.0,
                                                          lineWidth: 2.0,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        color: kAppBarColor,
                                        boxShadow: kBoxShadow,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Wrap(
                                                    children: [
                                                      Text("${movieM.title} ",
                                                          style:
                                                              kBoldTitleTextStyle),
                                                      Text(
                                                          (movieM.year == "")
                                                              ? ""
                                                              : "(${movieM.year})",
                                                          style:
                                                              kTitleTextStyle),
                                                    ],
                                                  ),
                                                ),
                                                // if (moviePreview.isFavorite)
                                                const Icon(
                                                  Icons.bookmark_sharp,
                                                  size: 15,
                                                  color: kDrawerTextColor,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 1.5),
                                            if (movieM.rating != 0)
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 12,
                                                  ),
                                                  Text(
                                                    movieM.rating.toString(),
                                                    style: kBoldRatingTextStyle,
                                                  ),
                                                ],
                                              ),
                                            Text(
                                              movieM.genres!.first,
                                              style: kBoldGenTextStyle,
                                            ),
                                            const SizedBox(height: 1),
                                            Text(
                                              movieM.summary!,
                                              style: kSubTitleCardBoxTextStyle,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ));
  }
}
