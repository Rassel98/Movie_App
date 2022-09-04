import 'package:flutter/material.dart';

const String weatherApiKey = 'add23394356f19aaaa6c6b9818c12958';
const String celsius = 'C';
const String fahrenheit = 'F';
const String metric = 'metric';
const String imperial = 'imperial';
const String degree = '\u00B0';
const String iconPrefix = 'https://openweathermap.org/img/wn/';
const String iconSuffix = '@2x.png';
const List<String> cities = [
  'Dhaka',
  'Mymensingh',
  'Bogora',
  'Tangaile',
  'Dinajpr',
  'Rajshahi',
  'Panchagar',
  'Sylete',
  'Kostia'
];

const List<String> searchMovie = [
  'All',
  "Adventure",
  "Action",
  "Fantasy",
  "Romance",
  "Drama",
  "Comedy",
  "Documentary"
];

const kMainGreenColor = Color(0xFF37A45E);
const kMainOrangeColor = Color(0xFFE58901);
const kMainBlueColor = Color(0xFF2C78C5);
const kMainPinkColor = Color(0xFFE84CAF);

const kPrimaryColor = Color(0xFF101010);
const kLightGrey = Color(0xFF545454);
const kAppBarColor = Color(0xFF1C1C1C);
const kTextShadowColor = Color(0x4D000000);
const kBackgroundShadowColor = Color(0x4D161616);
const kDrawerLineColor = Color(0xFF707070);
const kInactiveButtonColor = Color(0xFF474747);
const kDrawerTextColor = Color(0xFFBEBEBE);
const kSubTitleCardBoxColor = Color(0xFF8E8E8E);
const kSearchAppBarColor = Color(0xFF161616);

final kTextShadow = [
  const Shadow(
      offset: Offset(0, 0.1), blurRadius: 6.0, color: kTextShadowColor),
];

const kBoxShadow = [
  BoxShadow(
    color: kPrimaryColor,
    spreadRadius: 5,
    blurRadius: 30,
    offset: Offset(0, 3),
  ),
];

final kHomeScreenButtonTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
);

final kBoldTitleTextStyle = TextStyle(
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
);
final kBoldRatingTextStyle = TextStyle(
  fontSize: 10,
  color: Colors.amber,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
);
final kBoldGenTextStyle = TextStyle(
  fontSize: 10,
  color: kDrawerTextColor,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
);

final kTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  shadows: kTextShadow,
);

final kDrawerDescTextStyle = TextStyle(
  fontSize: 14,
  color: kDrawerTextColor,
  height: 0.19,
);

final kAppBarTitleTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
);

final kSplashScreenTextStyle = TextStyle(
  fontSize: 12.0,
  color: kLightGrey,
);

final kSubTitleCardBoxTextStyle = TextStyle(
  color: kSubTitleCardBoxColor,
  fontSize: 9,
);

final kSmallAppBarTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

final kSmallTitleTextStyle = TextStyle(fontSize: 40,fontWeight: FontWeight.bold);

const kTextFieldDecoration = InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);

const kMovieAppBarTitleTextStyle = TextStyle(fontSize: 22);

const kDetailScreenBoldTitle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);
const kDetailScreenRegularTitle = TextStyle(
  fontSize: 20,
);

const kHomeScreenButtonFirstText = "Populars";
const kHomeScreenButtonSecondText = "Coming Soon";
const kHomeScreenButtonThirdText = "Top Rated";
const kHomeScreenTitleText = "Watch Now";
const k404Text = "Movies not found";
const kFavoriteRemovedText = "Movie removed from Favorites";
const kFavoriteAddedText = "Movie added to Favorites";
const kDetailsScreenTitleText = "Overview";
const kStoryLineTitleText = "Storyline";
const kSplashScreenTitleText = "loading..";
const kFinderScreenTitleText = "Finder";
const kFavoriteScreenTitleText = "Favorites";
const kDrawerTitleFirstText = "THEME";
const kDrawerTitleSecondText = "ABOUT";
const kDrawerTitleThirdText = "DEPENDENCIES";
const kAppliedTheme = "Theme applied";
const kNotFoundErrorText = "Not found";
