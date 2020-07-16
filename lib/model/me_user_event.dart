class UserEventModel {
  int lasttime;
  bool more;
  int size;
  int code;
  List<Events> events;

  UserEventModel({this.lasttime, this.more, this.size, this.code, this.events});

  UserEventModel.fromJson(Map<String, dynamic> json) {
    lasttime = json['lasttime'];
    more = json['more'];
    size = json['size'];
    code = json['code'];
    if (json['events'] != null) {
      events = new List<Events>();
      json['events'].forEach((v) {
        events.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lasttime'] = this.lasttime;
    data['more'] = this.more;
    data['size'] = this.size;
    data['code'] = this.code;
    if (this.events != null) {
      data['events'] = this.events.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  User user;
  String json;
  int eventTime;
  Info info;

  Events({this.user, this.json, this.eventTime, this.info});

  Events.fromJson(Map<String, dynamic> jsons) {
    user = jsons['user'] != null ? new User.fromJson(jsons['user']) : null;
    json = jsons['json'];
    eventTime = jsons['eventTime'];
    info = jsons['info'] != null ? new Info.fromJson(jsons['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['json'] = this.json;
    data['eventTime'] = this.eventTime;
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    return data;
  }
}

class User {
  String nickname;
  String avatarUrl;

  User({this.nickname, this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    avatarUrl = json['avatarUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['avatarUrl'] = this.avatarUrl;
    return data;
  }
}

class Info {
  int likedCount;

  Info({this.likedCount});

  Info.fromJson(Map<String, dynamic> json) {
    likedCount = json['likedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['likedCount'] = this.likedCount;
    return data;
  }
}
