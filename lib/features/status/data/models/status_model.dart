class StatusModel {
  String? uid;
  String? content;
  String? type;
  String? time;
  String? storyId;
  List<dynamic>? viewers;

  StatusModel({
    this.uid,
    this.content,
    this.type,
    this.time,
    this.storyId,
    this.viewers,
  });

  StatusModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'] as String;
    content = json['content'] as String;
    type = json['type'] as String;
    time = json['time'] as String;
    storyId = json['storyId'] as String;
    viewers = json['viewers'] as List<dynamic>;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['content'] = content;
    data['type'] = type;
    data['time'] = time;
    data['storyId'] = storyId;
    data['viewers'] = viewers;
    return data;
  }
}
