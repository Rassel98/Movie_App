

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utils/constrant.dart';

class MovieCard extends StatelessWidget {
  // final MoviePreview moviePreview;
  // final Color themeColor;
  // final int? contentLoadedFromPage;

  // MovieCard({
  //   // required this.moviePreview,
  //   // required this.themeColor,
  //   // this.contentLoadedFromPage,
  // });

  @override
  Widget build(BuildContext context) {
    // List<Widget> stars =
    // starCalculator.getStars(rating: moviePreview.rating, starSize: 2.h);

    return GestureDetector(
      onTap: () async {
        // await navi.newScreen(
        //     context: context,
        //     newScreen: () => DetailsScreen(
        //       id: moviePreview.id,
        //       themeColor: themeColor,
        //     ));
        // if (contentLoadedFromPage != null)
        //   kHomeScreenKey.currentState!.pageSwitcher(contentLoadedFromPage!);
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            Container(
              height: 30,
              width: 40,
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
                      placeholder: (context, url) => Column(
                        children: [
                          Container(
                            height: 20,
                            child: Stack(
                              children: const [
                                Center(
                                  child: Icon(
                                    Icons.videocam,
                                    size: 20.0,
                                    color: kMainPinkColor,// ?? Colors.transparent,
                                    //color: Colors.transparent,
                                  ),
                                ),
                                SpinKitRing(
                                  //color: Colors.transparent,
                                  color: kMainPinkColor, //?? Colors.transparent,
                                  size: 50.0,
                                  lineWidth: 2.0,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      imageUrl:'jhh' ,
                      errorWidget: (context, url, error) => Column(
                        children: [
                          Container(
                            height: 20,
                            child: Stack(
                              children:const [
                                Center(
                                  child: Icon(
                                    Icons.videocam,
                                    size: 20.0,
                                    color: kMainPinkColor,// ?? Colors.transparent,
                                  ),
                                ),
                                SpinKitRing(
                                  color: kMainPinkColor,// ?? Colors.transparent,
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
                    padding: EdgeInsets.all(3),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Wrap(
                                children: [
                                  // Text("${moviePreview.title} ",
                                  //     style: kBoldTitleTextStyle),
                                  // Text(
                                  //     (moviePreview.year == "")
                                  //         ? ""
                                  //         : "(${moviePreview.year})",
                                  //     style: kTitleTextStyle),
                                ],
                              ),
                            ),
                           // if (moviePreview.isFavorite)
                              const Icon(
                                Icons.bookmark_sharp,
                                size: 15,
                                color: kInactiveButtonColor,
                              ),
                          ],
                        ),
                        // SizedBox(height: 1.5),
                        // if (stars.length != 0) Row(children: stars),
                        // SizedBox(height: 1),
                        // Text(
                        //   moviePreview.overview,
                        //   style: kSubTitleCardBoxTextStyle,
                        //   overflow: TextOverflow.ellipsis,
                        //   maxLines: 3,
                        // )
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
  }
}
