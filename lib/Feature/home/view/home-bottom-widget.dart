import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/Model/NowPlaying/now-playing.dart';

class HomeBottomWidget extends StatefulWidget {
  List<NowPlaying> response;

  HomeBottomWidget(this.response);

  @override
  _HomeBottomWidgetState createState() => _HomeBottomWidgetState();
}

class _HomeBottomWidgetState extends State<HomeBottomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.response.length == 0
          ? Center(
              child: new SpinKitThreeBounce(
        color: Colors.blue,
      ),
            )
          : Column(
              children: <Widget>[
                homeScreenBottomRecent(widget.response),
                homeScreenBottomNow(widget.response),
//          homeScreenBottomUp(ingredientsUp),
//          homeScreenBottomTv(ingredientsTv)
              ],
            ),
    );
  }
}

Widget homeScreenBottomRecent(List<NowPlaying> response) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Currently watched items",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            response.length < 7
                ? Text("")
                : Row(
                    children: <Widget>[
                      Text(
                        "More",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  )
          ],
        ),
      ),
      Container(
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int position) {
                return GestureDetector(
                  onTap: () {
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) {
//                          return DetailMovie(response[position].id);
//                        }));
                  },
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.black26,
                      ),
                    ], borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 6, vertical: 7),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 190,
                                width: 150,
                                child: Image.network(
                                  response[position].posterPath == null
                                      ? "https://garda-ac.co.id/assets/images/noimage.png"
                                      : "https://image.tmdb.org/t/p/w185/${response[position].posterPath}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                width: 180,
                                height: 60,
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                        Colors.black,
                                        Colors.black12
                                      ])),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                right: 10,
                                bottom: 10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          response[position].originalLanguage,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          response[position].releaseDate,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            response[position].voteAverage.toString(),
                                            style: TextStyle(
                                                fontSize: 14, color: Colors.black),
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 12,
                                          )
                                        ],
                                      )
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          height: 30,
                          width: 150,
                          child: Text(
                            response[position].originalTitle,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
    ],
  );
}

Color firstColor = Colors.orange;
Color secondColor = Colors.yellow;
Color xfirstColor = Colors.yellow;
Color xsecondColor = Colors.greenAccent;

Widget homeScreenBottomNow(List<NowPlaying> response) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Now playing",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              children: <Widget>[
                Text(
                  "More",
                  style: TextStyle(fontSize: 16),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )
              ],
            )
          ],
        ),
      ),
      Container(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int position) {
                return GestureDetector(
                  onTap: () {
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) {
//                          return DetailMovie(response[position].id);
//                        }));
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 280,
                                width: 210,
                                child: Image.network(
                                  response == null
                                      ? "google.com"
                                      : "https://image.tmdb.org/t/p/w185/${response[position].posterPath}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                width: 210,
                                height: 60,
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                        Colors.black,
                                        Colors.black12
                                      ])),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                right: 10,
                                bottom: 10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 180,
                                          child: Text(
                                            response[position].originalTitle,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Text(
                                          response[position].releaseDate,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
//                                      Container(
//                                        padding: EdgeInsets.symmetric(
//                                            horizontal: 6, vertical: 2),
//                                        decoration: BoxDecoration(
//                                            color: Colors.white,
//                                            shape: BoxShape.rectangle,
//                                            borderRadius: BorderRadius.all(
//                                                Radius.circular(10))),
//                                        child: Text(
//                                          response[position].video.toString(),
//                                          style: TextStyle(
//                                              fontSize: 14,
//                                              color: Colors.black),
//                                        ),
//                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }))
    ],
  );
}

List<String> gambar = [
  "http://cdn2.tstatic.net/bali/foto/bank/images/tes-kepribadian-gambar-pohon.jpg",
  "http://cdn2.tstatic.net/bali/foto/bank/images/tes-kepribadian-gambar-pohon.jpg",
  "http://cdn2.tstatic.net/bali/foto/bank/images/tes-kepribadian-gambar-pohon.jpg"
];
//
//Widget homeScreenBottomUp(List<Upcoming> response) {
//  return Column(
//    children: <Widget>[
//      Padding(
//        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//        child: Row(
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Text(
//              "Upcoming Movies",
//              style: TextStyle(
//                  color: Colors.black,
//                  fontSize: 16,
//                  fontWeight: FontWeight.bold),
//            ),
//            Spacer(),
//            Row(
//              children: <Widget>[
//                Text(
//                  "More",
//                  style: TextStyle(fontSize: 16),
//                ),
//                Icon(
//                  Icons.arrow_forward_ios,
//                  size: 16,
//                )
//              ],
//            )
//          ],
//        ),
//      ),
//      Container(
//        height: 210,
//        child: ListView.builder(
//            scrollDirection: Axis.horizontal,
//            controller: itemController,
//            itemCount: gambar.length,
//            itemBuilder: (BuildContext context, int position) {
//              return GestureDetector(
//                onTap: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) {
//                        return DetailMovie(response[position].id);
//                      }));
//                },
//                child: Container(
//                  margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//                  decoration: BoxDecoration(
//                    boxShadow: [
//                      BoxShadow(
//                        color: Colors.black12,
//                        blurRadius: 15.0,
//                        // has the effect of softening the shadow
//                        spreadRadius: 5.0,
//                        // has the effect of extending the shadow
//                        offset: Offset(
//                          10.0, // horizontal, move right 10
//                          10.0, // vertical, move down 10
//                        ),
//                      ),
//                    ],
//                  ),
//                  child: Stack(
//                    children: <Widget>[
//                      Container(
//                        height: 180.0,
//                        width: 420,
//                        margin: new EdgeInsets.only(top: 10),
//                        decoration: new BoxDecoration(
//                          color: Colors.white,
//                          shape: BoxShape.rectangle,
//                          borderRadius: new BorderRadius.circular(4.0),
//                        ),
//                        child: Container(
//                          padding: EdgeInsets.symmetric(vertical: 10),
//                          margin: EdgeInsets.only(left: 150),
//                          child: Column(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Container(
//                                width: 250,
//                                child: Text(
//                                  response[position].original_title,
//                                  style: TextStyle(
//                                      fontSize: 23,
//                                      fontWeight: FontWeight.bold),
//                                ),
//                              ),
//                              SizedBox(
//                                height: 20,
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                mainAxisSize: MainAxisSize.max,
//                                children: <Widget>[
//                                  Container(
//                                    child: Text(
//                                      "Relese date  :  ",
//                                      style: TextStyle(
//                                          fontSize: 20,
//                                          fontWeight: FontWeight.bold),
//                                    ),
//                                  ),
//                                  Container(
//                                    child: Text(
//                                      response[position].release_date,
//                                      style: TextStyle(fontSize: 20),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              SizedBox(
//                                height: 20,
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                mainAxisSize: MainAxisSize.max,
//                                children: <Widget>[
//                                  Container(
//                                    margin:
//                                    EdgeInsets.symmetric(horizontal: 6),
//                                    padding: EdgeInsets.symmetric(
//                                        horizontal: 16, vertical: 8),
//                                    child: Text(
//                                      ingredientsUp[position].id.toString(),
//                                      textAlign: TextAlign.center,
//                                      style: TextStyle(
//                                          color: Colors.black, fontSize: 14),
//                                    ),
//                                    decoration: BoxDecoration(
//                                        gradient: LinearGradient(colors: [
//                                          firstColor,
//                                          secondColor
//                                        ]),
//                                        borderRadius:
//                                        BorderRadius.circular(20)),
//                                  ),
//                                  Container(
//                                    margin:
//                                    EdgeInsets.symmetric(horizontal: 6),
//                                    padding: EdgeInsets.symmetric(
//                                        horizontal: 16, vertical: 8),
//                                    child: Text(
//                                      ingredientsUp[position].id.toString(),
//                                      textAlign: TextAlign.center,
//                                      style: TextStyle(
//                                          color: Colors.black, fontSize: 14),
//                                    ),
//                                    decoration: BoxDecoration(
//                                        gradient: LinearGradient(colors: [
//                                          xfirstColor,
//                                          xsecondColor
//                                        ]),
//                                        borderRadius:
//                                        BorderRadius.circular(20)),
//                                  )
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
//                      Positioned(
//                        top: 0,
//                        left: -8,
//                        child: Container(
////                  alignment: FractionalOffset.topLeft,
//                          child: new Image(
//                            image: new NetworkImage(
//                                "https://image.tmdb.org/t/p/w185/${response[position].poster_path}"),
//                            height: 180.0,
//                            width: 160.0,
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              );
////                  AnimatedBuilder(
////                  animation: itemController,
////                  builder: (context,widget){
////                    double value = 1;
////                    if(itemController.position.haveDimensions){
////                      value = itemController.page - position;
////                      value = (1 - (value.abs() * 0.3)).clamp(0, 1);
////                    }
////                    return Center(
////                      child: SizedBox(
////                        height: Curves.easeInOut.transform(value) * 100,
////                        width: Curves.easeInOut.transform(value) * 200,
////                      ),
////                    );
////                  },
////                  child: Container(
////                    margin: EdgeInsets.all(10),
////                    child: Image.network(gambar[position], fit: BoxFit.cover,),
////                  )
////                );
//            }),
//      ),
//    ],
//  );
//}
//
//final Color chipBackgroundColor = Color(0xFFa7ecfb);
//
//Widget homeScreenBottomTv(List<Tvshow> response) {
//  return Column(
//    children: <Widget>[
//      Padding(
//        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//        child: Row(
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Text(
//              "Popular TV Shows",
//              style: TextStyle(color: Colors.black, fontSize: 16),
//            ),
//            Spacer(),
//            Text(
//              "MORE(${ingredientsNow.length - 7})",
//              style: TextStyle(color: Colors.red, fontSize: 16),
//            )
//          ],
//        ),
//      ),
//      Container(
//          height: 280,
//          child: ListView.builder(
//              scrollDirection: Axis.horizontal,
//              itemCount: 7,
//              itemBuilder: (BuildContext context, int position) {
//                return GestureDetector(
//                    onTap: () {
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) {
//                            return DetailTv(response[position].id);
//                          }));
//                    },
//                    child: Column(
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: ClipRRect(
//                            borderRadius:
//                            BorderRadius.all(Radius.circular(10)),
//                            child: Stack(
//                              children: <Widget>[
//                                Container(
//                                  height: 210,
//                                  width: 180,
//                                  child: Image.network(
//                                    "https://image.tmdb.org/t/p/w185/${response[position].poster_path}",
//                                    fit: BoxFit.cover,
//                                  ),
//                                ),
//                                Positioned(
//                                  left: 0,
//                                  bottom: 0,
//                                  width: 180,
//                                  height: 60,
//                                  child: Container(
//                                    decoration: BoxDecoration(
//                                        gradient: LinearGradient(
//                                            begin: Alignment.bottomCenter,
//                                            end: Alignment.topCenter,
//                                            colors: [
//                                              Colors.black,
//                                              Colors.black12
//                                            ])),
//                                  ),
//                                ),
//                                Positioned(
//                                  left: 10,
//                                  right: 10,
//                                  bottom: 10,
//                                  child: Row(
//                                    mainAxisAlignment:
//                                    MainAxisAlignment.spaceBetween,
//                                    mainAxisSize: MainAxisSize.max,
//                                    children: <Widget>[
//                                      Column(
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Text(
//                                            response[position].id.toString(),
//                                            style: TextStyle(
//                                                fontWeight: FontWeight.bold,
//                                                color: Colors.white,
//                                                fontSize: 18),
//                                          ),
//                                          Text(
//                                            response[position].first_air_date,
//                                            style: TextStyle(
//                                                fontWeight: FontWeight.normal,
//                                                color: Colors.white,
//                                                fontSize: 14),
//                                          )
//                                        ],
//                                      ),
//                                      Container(
//                                        padding: EdgeInsets.symmetric(
//                                            horizontal: 6, vertical: 2),
//                                        decoration: BoxDecoration(
//                                            color: Colors.white,
//                                            shape: BoxShape.rectangle,
//                                            borderRadius: BorderRadius.all(
//                                                Radius.circular(10))),
//                                        child: Text(
//                                          response[position].video.toString(),
//                                          style: TextStyle(
//                                              fontSize: 14,
//                                              color: Colors.black),
//                                        ),
//                                      )
//                                    ],
//                                  ),
//                                )
//                              ],
//                            ),
//                          ),
//                        ),
//                        Container(
//                          width: 150,
//                          child: Text(
//                            response[position].original_name,
//                            style: TextStyle(
//                                color: Colors.black,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 18.0),
//                          ),
//                        ),
//                      ],
//                    ));
//              }))
//    ],
//  );
//}
//}
//
//final formatCurrency = NumberFormat.simpleCurrency();
