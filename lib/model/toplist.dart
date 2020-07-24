import 'list.dart';
class TopListModel {
  int code;
  List<ListModel> list;

  TopListModel({this.code, this.list});

  TopListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['list'] != null) {
      list = new List<ListModel>();
      json['list'].forEach((v) {
        list.add(new ListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
