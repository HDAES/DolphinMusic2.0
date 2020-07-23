import 'album.dart';
import 'artists.dart';

class EveryDayModel {
  int code;
  List<Recommend> recommend;

  EveryDayModel({this.code, this.recommend});

  EveryDayModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['recommend'] != null) {
      recommend = new List<Recommend>();
      json['recommend'].forEach((v) {
        recommend.add(new Recommend.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.recommend != null) {
      data['recommend'] = this.recommend.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recommend {
  String name;
  int id;
  int fee;
  int copyright;
  List<Artists> artists;
  Album album;

  Recommend(
      {this.name, this.id, this.fee, this.copyright, this.artists, this.album});

  Recommend.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    fee = json['fee'];
    copyright = json['copyright'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['fee'] = this.fee;
    data['copyright'] = this.copyright;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    return data;
  }
}


