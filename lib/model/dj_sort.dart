class DjSortModel {
  List<DjCategories> categories;
  int code;

  DjSortModel({this.categories, this.code});

  DjSortModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<DjCategories>();
      json['categories'].forEach((v) {
        categories.add(new DjCategories.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class DjCategories {
  int pic56x56Id;
  int pic96x96Id;
  int picPCBlack;
  int picWeb;
  int picIPad;
  int pic84x84Id;
  int picPCWhite;
  String picPCWhiteUrl;
  String picPCBlackStr;
  String picPCBlackUrl;
  String picWebStr;
  String picWebUrl;
  String picMacId;
  String picMacUrl;
  String picUWPId;
  String picUWPUrl;
  String picIPadStr;
  String picIPadUrl;
  String pic56x56IdStr;
  String pic56x56Url;
  String pic96x96IdStr;
  String pic96x96Url;
  String pic84x84IdUrl;
  String picPCWhiteStr;
  String name;
  int id;

  DjCategories(
      {this.pic56x56Id,
      this.pic96x96Id,
      this.picPCBlack,
      this.picWeb,
      this.picIPad,
      this.pic84x84Id,
      this.picPCWhite,
      this.picPCWhiteUrl,
      this.picPCBlackStr,
      this.picPCBlackUrl,
      this.picWebStr,
      this.picWebUrl,
      this.picMacId,
      this.picMacUrl,
      this.picUWPId,
      this.picUWPUrl,
      this.picIPadStr,
      this.picIPadUrl,
      this.pic56x56IdStr,
      this.pic56x56Url,
      this.pic96x96IdStr,
      this.pic96x96Url,
      this.pic84x84IdUrl,
      this.picPCWhiteStr,
      this.name,
      this.id});

  DjCategories.fromJson(Map<String, dynamic> json) {
    pic56x56Id = json['pic56x56Id'];
    pic96x96Id = json['pic96x96Id'];
    picPCBlack = json['picPCBlack'];
    picWeb = json['picWeb'];
    picIPad = json['picIPad'];
    pic84x84Id = json['pic84x84Id'];
    picPCWhite = json['picPCWhite'];
    picPCWhiteUrl = json['picPCWhiteUrl'];
    picPCBlackStr = json['picPCBlackStr'];
    picPCBlackUrl = json['picPCBlackUrl'];
    picWebStr = json['picWebStr'];
    picWebUrl = json['picWebUrl'];
    picMacId = json['picMacId'];
    picMacUrl = json['picMacUrl'];
    picUWPId = json['picUWPId'];
    picUWPUrl = json['picUWPUrl'];
    picIPadStr = json['picIPadStr'];
    picIPadUrl = json['picIPadUrl'];
    pic56x56IdStr = json['pic56x56IdStr'];
    pic56x56Url = json['pic56x56Url'];
    pic96x96IdStr = json['pic96x96IdStr'];
    pic96x96Url = json['pic96x96Url'];
    pic84x84IdUrl = json['pic84x84IdUrl'];
    picPCWhiteStr = json['picPCWhiteStr'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic56x56Id'] = this.pic56x56Id;
    data['pic96x96Id'] = this.pic96x96Id;
    data['picPCBlack'] = this.picPCBlack;
    data['picWeb'] = this.picWeb;
    data['picIPad'] = this.picIPad;
    data['pic84x84Id'] = this.pic84x84Id;
    data['picPCWhite'] = this.picPCWhite;
    data['picPCWhiteUrl'] = this.picPCWhiteUrl;
    data['picPCBlackStr'] = this.picPCBlackStr;
    data['picPCBlackUrl'] = this.picPCBlackUrl;
    data['picWebStr'] = this.picWebStr;
    data['picWebUrl'] = this.picWebUrl;
    data['picMacId'] = this.picMacId;
    data['picMacUrl'] = this.picMacUrl;
    data['picUWPId'] = this.picUWPId;
    data['picUWPUrl'] = this.picUWPUrl;
    data['picIPadStr'] = this.picIPadStr;
    data['picIPadUrl'] = this.picIPadUrl;
    data['pic56x56IdStr'] = this.pic56x56IdStr;
    data['pic56x56Url'] = this.pic56x56Url;
    data['pic96x96IdStr'] = this.pic96x96IdStr;
    data['pic96x96Url'] = this.pic96x96Url;
    data['pic84x84IdUrl'] = this.pic84x84IdUrl;
    data['picPCWhiteStr'] = this.picPCWhiteStr;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
