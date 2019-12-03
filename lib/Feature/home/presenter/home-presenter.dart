import 'dart:convert';

import 'package:movie_app/Feature/home/contract/home-contract.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Model/NowPlaying/now-playing.dart';

class HomePresenter {
  HomeContract view;

  HomePresenter(this.view);

  void getDataNow() async {
    String nowURL =
        "https://api.themoviedb.org/3/movie/now_playing?api_key=242346b956cd13fbd0d7e3b0b782c6ce&language=en-US";

    http.Response responseNow = await http.get(nowURL);

    var responseJsonNow = json.decode(responseNow.body);

    if (responseNow.statusCode == 200) {
      print('resp: ${responseJsonNow.toString()}');
      try {
        view.showDataNow((responseJsonNow['results'] as List)
            .map((p) => NowPlaying.fromJson(p))
            .toList());
      } catch (error) {
        view.showMessage(error.toString());
        print('ini woi errornya: ${error.toString()}');
        print(error.toString());
      }
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
