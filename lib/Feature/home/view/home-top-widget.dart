import 'package:flutter/material.dart';
import 'package:movie_app/utils/clipper/HomeClipper.dart';

class HomeTopWidget extends StatefulWidget {
  @override
  _HomeTopWidgetState createState() => _HomeTopWidgetState();
}

TextEditingController edtSearch = TextEditingController();
Color firstColor = Color(0xFF34c9eb);
Color secondColor = Color(0xFF347deb);
ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

class _HomeTopWidgetState extends State<HomeTopWidget> {
  var isMovieSelected = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: HomeClipper(),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [firstColor, secondColor])),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "MOVIE APP",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Spacer(),
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "What you \n want to search?",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextField(
                        cursorColor: appTheme.primaryColor,
//                       style: ,
                        controller: edtSearch,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 15),
                            suffixIcon: Material(
                              elevation: 2,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {
//                                  Navigator.push(context,
//                                      MaterialPageRoute(builder: (context) {
//                                    String query = edtSearch.text;
//                                    return SearchPage(query);
//                                  }));
                                },
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: "Search"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        child: SelectMovie(Icons.flight_takeoff, "Now Playing",
                            isMovieSelected),
                        onTap: () {
                          setState(() {
                            isMovieSelected = true;
                          });
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: SelectMovie(
                            Icons.hotel, "Popular", !isMovieSelected),
                        onTap: () {
                          setState(() {
                            isMovieSelected = false;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}

class SelectMovie extends StatefulWidget {

  final IconData iconData;
  final String text;
  final bool isSelected;

  SelectMovie(this.iconData, this.text, this.isSelected);


  @override
  _SelectMovieState createState() => _SelectMovieState();
}

class _SelectMovieState extends State<SelectMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: widget.isSelected
          ? BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.all(Radius.circular(20)))
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            widget.iconData,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}

