class RecMvModel {
  int code;
  int category;
  List<MvList> result;

  RecMvModel({this.code, this.category, this.result});

  RecMvModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    category = json['category'];
    if (json['result'] != null) {
      result = new List<MvList>();
      json['result'].forEach((v) {
        result.add(new MvList.fromJson(v));
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

class MvList {
  int id;
  int type;
  String name;
  String copywriter;
  String picUrl;
  bool canDislike;
  Null trackNumberUpdateTime;
  int duration;
  int playCount;
  bool subed;
  List<MvArtists> artists;
  String artistName;
  int artistId;
  String alg;

  MvList(
      {this.id,
      this.type,
      this.name,
      this.copywriter,
      this.picUrl,
      this.canDislike,
      this.trackNumberUpdateTime,
      this.duration,
      this.playCount,
      this.subed,
      this.artists,
      this.artistName,
      this.artistId,
      this.alg});

  MvList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    copywriter = json['copywriter'];
    picUrl = json['picUrl'];
    canDislike = json['canDislike'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    duration = json['duration'];
    playCount = json['playCount'];
    subed = json['subed'];
    if (json['artists'] != null) {
      artists = new List<MvArtists>();
      json['artists'].forEach((v) {
        artists.add(new MvArtists.fromJson(v));
      });
    }
    artistName = json['artistName'];
    artistId = json['artistId'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['copywriter'] = this.copywriter;
    data['picUrl'] = this.picUrl;
    data['canDislike'] = this.canDislike;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['duration'] = this.duration;
    data['playCount'] = this.playCount;
    data['subed'] = this.subed;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['artistName'] = this.artistName;
    data['artistId'] = this.artistId;
    data['alg'] = this.alg;
    return data;
  }
}

class MvArtists {
  int id;
  String name;

  MvArtists({this.id, this.name});

  MvArtists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
