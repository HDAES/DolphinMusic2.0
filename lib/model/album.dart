class Album {
  String name;
  int id;
  String picUrl;
  String blurPicUrl;

  Album({this.name, this.id, this.picUrl, this.blurPicUrl});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    picUrl = json['picUrl'];
    blurPicUrl = json['blurPicUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['picUrl'] = this.picUrl;
    data['blurPicUrl'] = this.blurPicUrl;
    return data;
  }
}
