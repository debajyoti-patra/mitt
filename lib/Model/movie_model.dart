// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
 final bool? adult;
 final String? backdropPath;
 final List<int>? genreIds;
 final int? id;
 final String? originalLanguage;
 final String? originalTitle;
 final String? overview;
 final double? popularity;
 final String? posterPath;
 final String? releaseDate;
 final String? title;
 final bool? video;
 final double? voteAverage;
 final int? voteCount;
 final bool? isChecked;
  MovieModel(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.isChecked=false});

  // MovieModel.fromJson(Map<dynamic, dynamic> json) {
  //   adult = json['adult'];
  //   backdropPath = json['backdrop_path'];
  //   genreIds = json['genre_ids'].cast<int>();
  //   id = json['id'];
  //   originalLanguage = json['original_language'];
  //   originalTitle = json['original_title'];
  //   overview = json['overview'];
  //   popularity = json['popularity'];
  //   posterPath = json['poster_path'];
  //   releaseDate = json['release_date'];
  //   title = json['title'];
  //   video = json['video'];
  //   voteAverage = json['vote_average'];
  //   voteCount = json['vote_count'];
  //   isChecked = false;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
  


  MovieModel copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
    bool? isChecked,
  }) {
    return MovieModel(
      adult: adult?? this.adult,
      backdropPath:backdropPath ?? this.backdropPath,
      genreIds:genreIds ?? this.genreIds,
      id:id ?? this.id,
      originalLanguage:originalLanguage ?? this.originalLanguage,
      originalTitle:originalTitle ?? this.originalTitle,
      overview :overview?? this.overview,
      popularity :popularity?? this.popularity,
      posterPath:posterPath ?? this.posterPath,
      releaseDate:releaseDate ?? this.releaseDate,
      title:title ?? this.title,
      video :video?? this.video,
      voteAverage:voteAverage ?? this.voteAverage,
      voteCount:voteCount ?? this.voteCount,
      isChecked:isChecked ?? this.isChecked,
    );
  }

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount,
      isChecked,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdropPath': backdropPath,
      'genreIds': genreIds,
      'id': id,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'isChecked': isChecked,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
     adult: map['adult'] != null ? map['adult'] as bool : null,
    backdropPath:  map['backdropPath'] != null ? map['backdropPath'] as String : null,
     genreIds: map['genreIds'] != null ? List<int>.from((map['genreIds'] as List<int>)): null,
    id:  map['id'] != null ? map['id'] as int : null,
     originalLanguage: map['originalLanguage'] != null ? map['originalLanguage'] as String : null,
     originalTitle: map['originalTitle'] != null ? map['originalTitle'] as String : null,
    overview:  map['overview'] != null ? map['overview'] as String : null,
     popularity: map['popularity'] != null ? map['popularity'] as double : null,
     posterPath: map['posterPath'] != null ? map['posterPath'] as String : null,
    releaseDate:  map['releaseDate'] != null ? map['releaseDate'] as String : null,
      title:map['title'] != null ? map['title'] as String : null,
     video: map['video'] != null ? map['video'] as bool : null,
    voteAverage:  map['voteAverage'] != null ? map['voteAverage'] as double : null,
     voteCount: map['voteCount'] != null ? map['voteCount'] as int : null,
     isChecked: map['isChecked'] != null ? map['isChecked'] as bool : null,
    );
  }

  // String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
