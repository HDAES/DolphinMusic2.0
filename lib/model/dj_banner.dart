class DjBannerModel {
  List<DjBanner> data;
  int code;

  DjBannerModel({this.data, this.code});

  DjBannerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<DjBanner>();
      json['data'].forEach((v) {
        data.add(new DjBanner.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class DjBanner {
  int targetId;
  int targetType;
  String pic;
  String url;
  String typeTitle;
  bool exclusive;

  DjBanner(
      {this.targetId,
      this.targetType,
      this.pic,
      this.url,
      this.typeTitle,
      this.exclusive});

  DjBanner.fromJson(Map<String, dynamic> json) {
    targetId = json['targetId'];
    targetType = json['targetType'];
    pic = json['pic'];
    url = json['url'];
    typeTitle = json['typeTitle'];
    exclusive = json['exclusive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['targetId'] = this.targetId;
    data['targetType'] = this.targetType;
    data['pic'] = this.pic;
    data['url'] = this.url;
    data['typeTitle'] = this.typeTitle;
    data['exclusive'] = this.exclusive;
    return data;
  }
}
