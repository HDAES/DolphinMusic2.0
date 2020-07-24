class ListModel {
  Null subscribed;
  Null creator;
  Null artists;
  List<Tracks> tracks;
  String updateFrequency;
  int backgroundCoverId;
  Null backgroundCoverUrl;
  int titleImage;
  Null titleImageUrl;
  Null englishTitle;
  bool opRecommend;
  Null recommendInfo;
  int specialType;
  bool newImported;
  int trackCount;
  String commentThreadId;
  int totalDuration;
  bool ordered;
  int privacy;
  int trackUpdateTime;
  int subscribedCount;
  int cloudTrackCount;
  int updateTime;
  String coverImgUrl;
  bool anonimous;
  int coverImgId;
  int adType;
  int trackNumberUpdateTime;
  int createTime;
  bool highQuality;
  String description;
  int status;
  int userId;
  int playCount;
  String name;
  int id;
  String coverImgIdStr;
  String toplistType;

  ListModel(
      {this.subscribed,
      this.creator,
      this.artists,
      this.tracks,
      this.updateFrequency,
      this.backgroundCoverId,
      this.backgroundCoverUrl,
      this.titleImage,
      this.titleImageUrl,
      this.englishTitle,
      this.opRecommend,
      this.recommendInfo,
      this.specialType,
      this.newImported,
      this.trackCount,
      this.commentThreadId,
      this.totalDuration,
      this.ordered,
      this.privacy,
      this.trackUpdateTime,
      this.subscribedCount,
      this.cloudTrackCount,
      this.updateTime,
      this.coverImgUrl,
      this.anonimous,
      this.coverImgId,
      this.adType,
      this.trackNumberUpdateTime,
      this.createTime,
      this.highQuality,
      this.description,
      this.status,
      this.userId,
      this.playCount,
      this.name,
      this.id,
      this.coverImgIdStr,
      this.toplistType});

  ListModel.fromJson(Map<String, dynamic> json) {
    subscribed = json['subscribed'];
    creator = json['creator'];
    artists = json['artists'];
    if (json['tracks'] != null) {
      tracks = new List<Tracks>();
      json['tracks'].forEach((v) {
        tracks.add(new Tracks.fromJson(v));
      });
    }
    updateFrequency = json['updateFrequency'];
    backgroundCoverId = json['backgroundCoverId'];
    backgroundCoverUrl = json['backgroundCoverUrl'];
    titleImage = json['titleImage'];
    titleImageUrl = json['titleImageUrl'];
    englishTitle = json['englishTitle'];
    opRecommend = json['opRecommend'];
    recommendInfo = json['recommendInfo'];
    specialType = json['specialType'];
    newImported = json['newImported'];
    trackCount = json['trackCount'];
    commentThreadId = json['commentThreadId'];
    totalDuration = json['totalDuration'];
    ordered = json['ordered'];
    privacy = json['privacy'];
    trackUpdateTime = json['trackUpdateTime'];
    subscribedCount = json['subscribedCount'];
    cloudTrackCount = json['cloudTrackCount'];
    updateTime = json['updateTime'];
    coverImgUrl = json['coverImgUrl'];
    anonimous = json['anonimous'];
    coverImgId = json['coverImgId'];
    adType = json['adType'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    createTime = json['createTime'];
    highQuality = json['highQuality'];
    description = json['description'];
    status = json['status'];
    userId = json['userId'];
    playCount = json['playCount'];
    name = json['name'];
    id = json['id'];
    coverImgIdStr = json['coverImgId_str'];
    toplistType = json['ToplistType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscribed'] = this.subscribed;
    data['creator'] = this.creator;
    data['artists'] = this.artists;
    if (this.tracks != null) {
      data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
    }
    data['updateFrequency'] = this.updateFrequency;
    data['backgroundCoverId'] = this.backgroundCoverId;
    data['backgroundCoverUrl'] = this.backgroundCoverUrl;
    data['titleImage'] = this.titleImage;
    data['titleImageUrl'] = this.titleImageUrl;
    data['englishTitle'] = this.englishTitle;
    data['opRecommend'] = this.opRecommend;
    data['recommendInfo'] = this.recommendInfo;
    data['specialType'] = this.specialType;
    data['newImported'] = this.newImported;
    data['trackCount'] = this.trackCount;
    data['commentThreadId'] = this.commentThreadId;
    data['totalDuration'] = this.totalDuration;
    data['ordered'] = this.ordered;
    data['privacy'] = this.privacy;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['subscribedCount'] = this.subscribedCount;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['updateTime'] = this.updateTime;
    data['coverImgUrl'] = this.coverImgUrl;
    data['anonimous'] = this.anonimous;
    data['coverImgId'] = this.coverImgId;
    data['adType'] = this.adType;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['createTime'] = this.createTime;
    data['highQuality'] = this.highQuality;
    data['description'] = this.description;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['playCount'] = this.playCount;
    data['name'] = this.name;
    data['id'] = this.id;
    data['coverImgId_str'] = this.coverImgIdStr;
    data['ToplistType'] = this.toplistType;
    return data;
  }
}

class Tracks {
  String first;
  String second;

  Tracks({this.first, this.second});

  Tracks.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    return data;
  }
}
