class DjPayToplistModel {
  int code;
  Null msg;
  Data data;

  DjPayToplistModel({this.code, this.msg, this.data});

  DjPayToplistModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int total;
  int updateTime;
  List<PayList> list;

  Data({this.total, this.updateTime, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    updateTime = json['updateTime'];
    if (json['list'] != null) {
      list = new List<PayList>();
      json['list'].forEach((v) {
        list.add(new PayList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['updateTime'] = this.updateTime;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PayList {
  int id;
  int rank;
  int lastRank;
  int score;
  String name;
  String picUrl;
  String creatorName;

  PayList(
      {this.id,
      this.rank,
      this.lastRank,
      this.score,
      this.name,
      this.picUrl,
      this.creatorName});

  PayList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'];
    lastRank = json['lastRank'];
    score = json['score'];
    name = json['name'];
    picUrl = json['picUrl'];
    creatorName = json['creatorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rank'] = this.rank;
    data['lastRank'] = this.lastRank;
    data['score'] = this.score;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
    data['creatorName'] = this.creatorName;
    return data;
  }
}
