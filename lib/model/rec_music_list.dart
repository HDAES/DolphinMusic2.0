import 'album.dart';
import 'artists.dart';

class RecMusicListModel {
  int code;
  int category;
  List<MusicList> result;

  RecMusicListModel({this.code, this.category, this.result});

  RecMusicListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    category = json['category'];
    if (json['result'] != null) {
      result = new List<MusicList>();
      json['result'].forEach((v) {
        result.add(new MusicList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['category'] = this.category;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicList {
  int id;
  int type;
  String name;
  String picUrl;
  Song song;

  MusicList({this.id, this.type, this.name, this.picUrl, this.song});

  MusicList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    picUrl = json['picUrl'];
    song = json['song'] != null ? new Song.fromJson(json['song']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
    if (this.song != null) {
      data['song'] = this.song.toJson();
    }
    return data;
  }
}

class Song {
  List<Artists> artists;
  Album album;
  int mvid;

  Song({this.artists, this.album, this.mvid});

  Song.fromJson(Map<String, dynamic> json) {
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    mvid = json['mvid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['mvid'] = this.mvid;
    return data;
  }
}




