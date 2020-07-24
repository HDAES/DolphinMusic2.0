class DjPerferedModel {
  int code;
  Null msg;
  List<Data> data;

  DjPerferedModel({this.code, this.msg, this.data});

  DjPerferedModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String rcmdText;
  int radioFeeType;
  int feeScope;
  String picUrl;
  int programCount;
  int subCount;
  bool subed;
  Null playCount;
  String alg;
  Null originalPrice;
  Null discountPrice;
  String lastProgramName;
  Null traceId;

  Data(
      {this.id,
      this.name,
      this.rcmdText,
      this.radioFeeType,
      this.feeScope,
      this.picUrl,
      this.programCount,
      this.subCount,
      this.subed,
      this.playCount,
      this.alg,
      this.originalPrice,
      this.discountPrice,
      this.lastProgramName,
      this.traceId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rcmdText = json['rcmdText'];
    radioFeeType = json['radioFeeType'];
    feeScope = json['feeScope'];
    picUrl = json['picUrl'];
    programCount = json['programCount'];
    subCount = json['subCount'];
    subed = json['subed'];
    playCount = json['playCount'];
    alg = json['alg'];
    originalPrice = json['originalPrice'];
    discountPrice = json['discountPrice'];
    lastProgramName = json['lastProgramName'];
    traceId = json['traceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rcmdText'] = this.rcmdText;
    data['radioFeeType'] = this.radioFeeType;
    data['feeScope'] = this.feeScope;
    data['picUrl'] = this.picUrl;
    data['programCount'] = this.programCount;
    data['subCount'] = this.subCount;
    data['subed'] = this.subed;
    data['playCount'] = this.playCount;
    data['alg'] = this.alg;
    data['originalPrice'] = this.originalPrice;
    data['discountPrice'] = this.discountPrice;
    data['lastProgramName'] = this.lastProgramName;
    data['traceId'] = this.traceId;
    return data;
  }
}
