class HotWallModel {
  int code;
  String message;
  List<HotWall> data;

  HotWallModel({this.code, this.message, this.data});

  HotWallModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<HotWall>();
      json['data'].forEach((v) {
        data.add(new HotWall.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotWall {
  int id;
  String threadId;
  String content;
  int time;
  SimpleUserInfo simpleUserInfo;
  int likedCount;
  int replyCount;
  SimpleResourceInfo simpleResourceInfo;
  bool liked;

  HotWall(
      {this.id,
      this.threadId,
      this.content,
      this.time,
      this.simpleUserInfo,
      this.likedCount,
      this.replyCount,
      this.simpleResourceInfo,
      this.liked});

  HotWall.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    threadId = json['threadId'];
    content = json['content'];
    time = json['time'];
    simpleUserInfo = json['simpleUserInfo'] != null
        ? new SimpleUserInfo.fromJson(json['simpleUserInfo'])
        : null;
    likedCount = json['likedCount'];
    replyCount = json['replyCount'];
    simpleResourceInfo = json['simpleResourceInfo'] != null
        ? new SimpleResourceInfo.fromJson(json['simpleResourceInfo'])
        : null;
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['threadId'] = this.threadId;
    data['content'] = this.content;
    data['time'] = this.time;
    if (this.simpleUserInfo != null) {
      data['simpleUserInfo'] = this.simpleUserInfo.toJson();
    }
    data['likedCount'] = this.likedCount;
    data['replyCount'] = this.replyCount;
    if (this.simpleResourceInfo != null) {
      data['simpleResourceInfo'] = this.simpleResourceInfo.toJson();
    }
    data['liked'] = this.liked;
    return data;
  }
}

class SimpleUserInfo {
  int userId;
  String nickname;
  String avatar;
  bool followed;
  int userType;

  SimpleUserInfo(
      {this.userId, this.nickname, this.avatar, this.followed, this.userType});

  SimpleUserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    followed = json['followed'];
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['followed'] = this.followed;
    data['userType'] = this.userType;
    return data;
  }
}

class SimpleResourceInfo {
  int songId;
  String threadId;
  String name;
  List<HotWallArtists> artists;
  String songCoverUrl;

  SimpleResourceInfo(
      {this.songId, this.threadId, this.name, this.artists, this.songCoverUrl});

  SimpleResourceInfo.fromJson(Map<String, dynamic> json) {
    songId = json['songId'];
    threadId = json['threadId'];
    name = json['name'];
    if (json['artists'] != null) {
      artists = new List<HotWallArtists>();
      json['artists'].forEach((v) {
        artists.add(new HotWallArtists.fromJson(v));
      });
    }
    songCoverUrl = json['songCoverUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['songId'] = this.songId;
    data['threadId'] = this.threadId;
    data['name'] = this.name;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['songCoverUrl'] = this.songCoverUrl;
    return data;
  }
}

class HotWallArtists {
  int id;
  String name;

  HotWallArtists({this.id, this.name});

  HotWallArtists.fromJson(Map<String, dynamic> json) {
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
