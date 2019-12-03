import 'package:movie_app/Model/NowPlaying/now-playing.dart';
import 'package:movie_app/Model/tvshow/tvshow.dart';
import 'package:movie_app/Model/upcoming/upcoming.dart';

abstract class HomeContract{
  void loading();
  void dissLoading();
  void showMessage(String message);
  void showDataNow(List<NowPlaying> ingredientsNow);
  void showDataUp(List<Upcoming> ingredientsUp);
  void showDataTv(List<Tvshow> ingredientsTv);
}