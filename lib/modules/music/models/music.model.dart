// To parse this JSON data, do
//
//     final musicResultModel = musicResultModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

MusicResultModel musicResultModelFromJson(String str) => MusicResultModel.fromJson(json.decode(str));

String musicResultModelToJson(MusicResultModel data) => json.encode(data.toJson());

class MusicResultModel {
    MusicResultModel({
        this.resultCount,
        this.results,
    });

    int? resultCount;
    List<Result>? results;

    factory MusicResultModel.fromJson(Map<String, dynamic> json) => MusicResultModel(
        resultCount: json["resultCount"] == null ? null : json["resultCount"],
        results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resultCount": resultCount == null ? null : resultCount,
        "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.wrapperType,
        this.kind,
        this.artistId,
        this.collectionId,
        this.trackId,
        this.artistName,
        this.collectionName,
        this.trackName,
        this.collectionCensoredName,
        this.trackCensoredName,
        this.artistViewUrl,
        this.collectionViewUrl,
        this.trackViewUrl,
        this.previewUrl,
        this.artworkUrl30,
        this.artworkUrl60,
        this.artworkUrl100,
        this.collectionPrice,
        this.trackPrice,
        this.releaseDate,
        this.collectionExplicitness,
        this.trackExplicitness,
        this.discCount,
        this.discNumber,
        this.trackCount,
        this.trackNumber,
        this.trackTimeMillis,
        this.country,
        this.currency,
        this.primaryGenreName,
        this.isStreamable,
        this.contentAdvisoryRating,
        this.copyright,
        this.description,
        this.collectionArtistId,
        this.collectionArtistName,
        this.feedUrl,
        this.trackRentalPrice,
        this.collectionHdPrice,
        this.trackHdPrice,
        this.trackHdRentalPrice,
        this.artworkUrl600,
        this.genreIds,
        this.genres,
    });

    String? wrapperType;
    String? kind;
    int? artistId;
    int? collectionId;
    int? trackId;
    String? artistName;
    String? collectionName;
    String? trackName;
    String? collectionCensoredName;
    String? trackCensoredName;
    String? artistViewUrl;
    String? collectionViewUrl;
    String? trackViewUrl;
    String? previewUrl;
    String? artworkUrl30;
    String? artworkUrl60;
    String? artworkUrl100;
    double? collectionPrice;
    double? trackPrice;
    String? releaseDate;
    String? collectionExplicitness;
    String? trackExplicitness;
    int? discCount;
    int? discNumber;
    int? trackCount;
    int? trackNumber;
    int? trackTimeMillis;
    String? country;
    String? currency;
    String? primaryGenreName;
    bool? isStreamable;
    String? contentAdvisoryRating;
    String? copyright;
    String? description;
    int? collectionArtistId;
    String? collectionArtistName;
    String? feedUrl;
    int? trackRentalPrice;
    int? collectionHdPrice;
    int? trackHdPrice;
    int? trackHdRentalPrice;
    String? artworkUrl600;
    List<String>? genreIds;
    List<String>? genres;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        wrapperType: json["wrapperType"] == null ? null : json["wrapperType"],
        kind: json["kind"] == null ? null : json["kind"],
        artistId: json["artistId"] == null ? null : json["artistId"],
        collectionId: json["collectionId"] == null ? null : json["collectionId"],
        trackId: json["trackId"] == null ? null : json["trackId"],
        artistName: json["artistName"] == null ? null : json["artistName"],
        collectionName: json["collectionName"] == null ? null : json["collectionName"],
        trackName: json["trackName"] == null ? null : json["trackName"],
        collectionCensoredName: json["collectionCensoredName"] == null ? null : json["collectionCensoredName"],
        trackCensoredName: json["trackCensoredName"] == null ? null : json["trackCensoredName"],
        artistViewUrl: json["artistViewUrl"] == null ? null : json["artistViewUrl"],
        collectionViewUrl: json["collectionViewUrl"] == null ? null : json["collectionViewUrl"],
        trackViewUrl: json["trackViewUrl"] == null ? null : json["trackViewUrl"],
        previewUrl: json["previewUrl"] == null ? null : json["previewUrl"],
        artworkUrl30: json["artworkUrl30"] == null ? null : json["artworkUrl30"],
        artworkUrl60: json["artworkUrl60"] == null ? null : json["artworkUrl60"],
        artworkUrl100: json["artworkUrl100"] == null ? null : json["artworkUrl100"],
        collectionPrice: json["collectionPrice"] == null ? null : json["collectionPrice"].toDouble(),
        trackPrice: json["trackPrice"] == null ? null : json["trackPrice"].toDouble(),
        releaseDate: json["releaseDate"] == null ? null : json["releaseDate"],
        collectionExplicitness: json["collectionExplicitness"] == null ? null : json["collectionExplicitness"],
        trackExplicitness: json["trackExplicitness"] == null ? null : json["trackExplicitness"],
        discCount: json["discCount"] == null ? null : json["discCount"],
        discNumber: json["discNumber"] == null ? null : json["discNumber"],
        trackCount: json["trackCount"] == null ? null : json["trackCount"],
        trackNumber: json["trackNumber"] == null ? null : json["trackNumber"],
        trackTimeMillis: json["trackTimeMillis"] == null ? null : json["trackTimeMillis"],
        country: json["country"] == null ? null : json["country"],
        currency: json["currency"] == null ? null : json["currency"],
        primaryGenreName: json["primaryGenreName"] == null ? null : json["primaryGenreName"],
        isStreamable: json["isStreamable"] == null ? null : json["isStreamable"],
        contentAdvisoryRating: json["contentAdvisoryRating"] == null ? null : json["contentAdvisoryRating"],
        copyright: json["copyright"] == null ? null : json["copyright"],
        description: json["description"] == null ? null : json["description"],
        collectionArtistId: json["collectionArtistId"] == null ? null : json["collectionArtistId"],
        collectionArtistName: json["collectionArtistName"] == null ? null : json["collectionArtistName"],
        feedUrl: json["feedUrl"] == null ? null : json["feedUrl"],
        trackRentalPrice: json["trackRentalPrice"] == null ? null : json["trackRentalPrice"],
        collectionHdPrice: json["collectionHdPrice"] == null ? null : json["collectionHdPrice"],
        trackHdPrice: json["trackHdPrice"] == null ? null : json["trackHdPrice"],
        trackHdRentalPrice: json["trackHdRentalPrice"] == null ? null : json["trackHdRentalPrice"],
        artworkUrl600: json["artworkUrl600"] == null ? null : json["artworkUrl600"],
        genreIds: json["genreIds"] == null ? null : List<String>.from(json["genreIds"].map((x) => x)),
        genres: json["genres"] == null ? null : List<String>.from(json["genres"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "wrapperType": wrapperType == null ? null : wrapperType,
        "kind": kind == null ? null : kind,
        "artistId": artistId == null ? null : artistId,
        "collectionId": collectionId == null ? null : collectionId,
        "trackId": trackId == null ? null : trackId,
        "artistName": artistName == null ? null : artistName,
        "collectionName": collectionName == null ? null : collectionName,
        "trackName": trackName == null ? null : trackName,
        "collectionCensoredName": collectionCensoredName == null ? null : collectionCensoredName,
        "trackCensoredName": trackCensoredName == null ? null : trackCensoredName,
        "artistViewUrl": artistViewUrl == null ? null : artistViewUrl,
        "collectionViewUrl": collectionViewUrl == null ? null : collectionViewUrl,
        "trackViewUrl": trackViewUrl == null ? null : trackViewUrl,
        "previewUrl": previewUrl == null ? null : previewUrl,
        "artworkUrl30": artworkUrl30 == null ? null : artworkUrl30,
        "artworkUrl60": artworkUrl60 == null ? null : artworkUrl60,
        "artworkUrl100": artworkUrl100 == null ? null : artworkUrl100,
        "collectionPrice": collectionPrice == null ? null : collectionPrice,
        "trackPrice": trackPrice == null ? null : trackPrice,
        "releaseDate": releaseDate == null ? null : releaseDate,
        "collectionExplicitness": collectionExplicitness == null ? null : collectionExplicitness,
        "trackExplicitness": trackExplicitness == null ? null : trackExplicitness,
        "discCount": discCount == null ? null : discCount,
        "discNumber": discNumber == null ? null : discNumber,
        "trackCount": trackCount == null ? null : trackCount,
        "trackNumber": trackNumber == null ? null : trackNumber,
        "trackTimeMillis": trackTimeMillis == null ? null : trackTimeMillis,
        "country": country == null ? null : country,
        "currency": currency == null ? null : currency,
        "primaryGenreName": primaryGenreName == null ? null : primaryGenreName,
        "isStreamable": isStreamable == null ? null : isStreamable,
        "contentAdvisoryRating": contentAdvisoryRating == null ? null : contentAdvisoryRating,
        "copyright": copyright == null ? null : copyright,
        "description": description == null ? null : description,
        "collectionArtistId": collectionArtistId == null ? null : collectionArtistId,
        "collectionArtistName": collectionArtistName == null ? null : collectionArtistName,
        "feedUrl": feedUrl == null ? null : feedUrl,
        "trackRentalPrice": trackRentalPrice == null ? null : trackRentalPrice,
        "collectionHdPrice": collectionHdPrice == null ? null : collectionHdPrice,
        "trackHdPrice": trackHdPrice == null ? null : trackHdPrice,
        "trackHdRentalPrice": trackHdRentalPrice == null ? null : trackHdRentalPrice,
        "artworkUrl600": artworkUrl600 == null ? null : artworkUrl600,
        "genreIds": genreIds == null ? null : List<dynamic>.from(genreIds!.map((x) => x)),
        "genres": genres == null ? null : List<dynamic>.from(genres!.map((x) => x)),
    };
}
