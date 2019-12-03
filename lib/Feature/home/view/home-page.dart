import 'package:flutter/material.dart';
import 'package:movie_app/Feature/BottomNavigation/BottomNavigation.dart';
import 'package:movie_app/Feature/home/contract/home-contract.dart';
import 'package:movie_app/Feature/home/presenter/home-presenter.dart';
import 'package:movie_app/Model/NowPlaying/now-playing.dart';
import 'package:movie_app/Model/tvshow/tvshow.dart';
import 'package:movie_app/Model/upcoming/upcoming.dart';

import 'home-bottom-widget.dart';
import 'home-top-widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeContract{

  HomePresenter presenter;
  PageController itemController;
  List<NowPlaying> ingredientsNow = [];
  List<Upcoming> ingredientsUp = [];
  List<Tvshow> ingredientsTv = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter = HomePresenter(this);
    itemController = PageController(initialPage: 1, viewportFraction: 0.6);
    presenter.getDataNow();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: <Widget>[
            HomeTopWidget(),
            HomeBottomWidget(ingredientsNow)
          ],
        ),
      ),
//      bottomNavigationBar: BottomNavigation(),
    );
  }

  @override
  void dissLoading() {
    // TODO: implement dissLoading
  }

  @override
  void loading() {
    // TODO: implement loading
  }

  @override
  void showMessage(String message) {
  }

  @override
  void showDataNow(List<NowPlaying> ingredientsNow) {
    setState(() {
      this.ingredientsNow = ingredientsNow;
    });
  }

  @override
  void showDataTv(List<Tvshow> ingredientsTv) {
    // TODO: implement showDataTv
  }

  @override
  void showDataUp(List<Upcoming> ingredientsUp) {
    // TODO: implement showDataUp
  }

}
