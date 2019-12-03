

class Tvshow {
  String originalName;
  String name;
  double popularity;
  int voteCount;
  String firstAirDate;
  String backdropPath;
  String originalLanguage;
  int id;
  double voteAverage;
  String overview;
  String posterPath;

  Tvshow(
      this.originalName,
        this.name,
        this.popularity,
        this.voteCount,
        this.firstAirDate,
        this.backdropPath,
        this.originalLanguage,
        this.id,
        this.voteAverage,
        this.overview,
        this.posterPath);

  Tvshow.fromJson(Map<String, dynamic> json) {
    originalName = json['original_name'];
    name = json['name'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    firstAirDate = json['first_air_date'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    id = json['id'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    posterPath = json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_name'] = this.originalName;
    data['name'] = this.name;
    data['popularity'] = this.popularity;
    data['vote_count'] = this.voteCount;
    data['first_air_date'] = this.firstAirDate;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    return data;
  }
}