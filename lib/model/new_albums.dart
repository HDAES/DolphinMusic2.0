import 'album.dart';

class NewAlbumsModel {
  int code;
  List<Album> albums;

  NewAlbumsModel({this.code, this.albums});

  NewAlbumsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['albums'] != null) {
      albums = new List<Album>();
      json['albums'].forEach((v) {
        albums.add(new Album.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.albums != null) {
      data['albums'] = this.albums.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



