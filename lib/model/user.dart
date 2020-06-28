class UserModel {
  int loginType;
  int code;
  Account account;
  String token;
  Profile profile;

  UserModel(
      {this.loginType, this.code, this.account, this.token, this.profile});

  UserModel.fromJson(Map<String, dynamic> json) {
    loginType = json['loginType'];
    code = json['code'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    token = json['token'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginType'] = this.loginType;
    data['code'] = this.code;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    data['token'] = this.token;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    return data;
  }
}

class Account {
  int id;
  String userName;
  int createTime;
  int vipType;
  int viptypeVersion;

  Account(
      {this.id,
      this.userName,
      this.createTime,
      this.vipType,
      this.viptypeVersion});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    createTime = json['createTime'];
    vipType = json['vipType'];
    viptypeVersion = json['viptypeVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['createTime'] = this.createTime;
    data['vipType'] = this.vipType;
    data['viptypeVersion'] = this.viptypeVersion;
    return data;
  }
}

class Profile {
  String nickname;
  int birthday;
  int city;
  int userType;
  String avatarUrl;
  String backgroundUrl;
  String signature;
  int followeds;
  int follows;
  int eventCount;
  int playlistCount;
  int playlistBeSubscribedCount;

  Profile(
      {this.nickname,
      this.birthday,
      this.city,
      this.userType,
      this.avatarUrl,
      this.backgroundUrl,
      this.signature,
      this.followeds,
      this.follows,
      this.eventCount,
      this.playlistCount,
      this.playlistBeSubscribedCount});

  Profile.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    birthday = json['birthday'];
    city = json['city'];
    userType = json['userType'];
    avatarUrl = json['avatarUrl'];
    backgroundUrl = json['backgroundUrl'];
    signature = json['signature'];
    followeds = json['followeds'];
    follows = json['follows'];
    eventCount = json['eventCount'];
    playlistCount = json['playlistCount'];
    playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['birthday'] = this.birthday;
    data['city'] = this.city;
    data['userType'] = this.userType;
    data['avatarUrl'] = this.avatarUrl;
    data['backgroundUrl'] = this.backgroundUrl;
    data['signature'] = this.signature;
    data['followeds'] = this.followeds;
    data['follows'] = this.follows;
    data['eventCount'] = this.eventCount;
    data['playlistCount'] = this.playlistCount;
    data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
    return data;
  }
}
