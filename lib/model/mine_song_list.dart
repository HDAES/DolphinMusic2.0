class MineSongListModel {
  bool more;
  List<Playlist> playlist;
  int code;

  MineSongListModel({this.more, this.playlist, this.code});

  MineSongListModel.fromJson(Map<String, dynamic> json) {
    more = json['more'];
    if (json['playlist'] != null) {
      playlist = new List<Playlist>();
      json['playlist'].forEach((v) {
        playlist.add(new Playlist.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['more'] = this.more;
    if (this.playlist != null) {
      data['playlist'] = this.playlist.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Playlist {
  int userId;
  int createTime;
  int updateTime;
  String coverImgUrl;
  int playCount;
  int trackCount;
  bool ordered;
  String description;
  List<String> tags;
  int status;
  String name;
  int id;

  Playlist(
      {this.userId,
      this.createTime,
      this.updateTime,
      this.coverImgUrl,
      this.playCount,
      this.trackCount,
      this.ordered,
      this.description,
      this.tags,
      this.status,
      this.name,
      this.id});

  Playlist.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    coverImgUrl = json['coverImgUrl'];
    playCount = json['playCount'];
    trackCount = json['trackCount'];
    ordered = json['ordered'];
    description = json['description'];
    tags = json['tags'].cast<String>();
    status = json['status'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['coverImgUrl'] = this.coverImgUrl;
    data['playCount'] = this.playCount;
    data['trackCount'] = this.trackCount;
    data['ordered'] = this.ordered;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['status'] = this.status;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
