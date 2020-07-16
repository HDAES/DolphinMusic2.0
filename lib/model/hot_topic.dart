class HotTopicModel {
  int code;
  List<HotTopic> hot;

  HotTopicModel({this.code, this.hot});

  HotTopicModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['hot'] != null) {
      hot = new List<HotTopic>();
      json['hot'].forEach((v) {
        hot.add(new HotTopic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.hot != null) {
      data['hot'] = this.hot.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotTopic {
  int actId;
  String title;
  List<String> text;
  int participateCount;
  String sharePicUrl;
  String reason;
  bool isDefaultImg;
  String alg;

  HotTopic(
      {this.actId,
      this.title,
      this.text,
      this.participateCount,
      this.sharePicUrl,
      this.reason,
      this.isDefaultImg,
      this.alg});

  HotTopic.fromJson(Map<String, dynamic> json) {
    actId = json['actId'];
    title = json['title'];
    text = json['text'].cast<String>();
    participateCount = json['participateCount'];
    sharePicUrl = json['sharePicUrl'];
    reason = json['reason'];
    isDefaultImg = json['isDefaultImg'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actId'] = this.actId;
    data['title'] = this.title;
    data['text'] = this.text;
    data['participateCount'] = this.participateCount;
    data['sharePicUrl'] = this.sharePicUrl;
    data['reason'] = this.reason;
    data['isDefaultImg'] = this.isDefaultImg;
    data['alg'] = this.alg;
    return data;
  }
}
