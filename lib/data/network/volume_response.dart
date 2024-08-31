import 'dart:convert';

class VolumeResponse {
  int id;
  String title;
  dynamic describe;

  VolumeResponse({
    required this.id,
    required this.title,
    required this.describe,
  });

  factory VolumeResponse.fromJson(Map<String, dynamic> json) => VolumeResponse(
        id: json['id'],
        title: json['title'],
        describe: json['describe'],
      );
}

List<VolumeResponse> volumeResponseFromJson(String str) =>
    List<VolumeResponse>.from(
      json.decode(str).map((x) => VolumeResponse.fromJson(x)),
    );

class ChapterResponse {
  int id;
  int novelId;
  int parentId;
  String title;
  int creator;
  dynamic describe;
  int limitLv;
  int cost;
  int? translator;
  int? porter;
  dynamic proofreader;
  dynamic polish;
  DateTime episodeCreateTime;
  DateTime episodeUpdateTime;

  ChapterResponse({
    required this.id,
    required this.novelId,
    required this.parentId,
    required this.title,
    required this.creator,
    required this.describe,
    required this.limitLv,
    required this.cost,
    required this.translator,
    required this.porter,
    required this.proofreader,
    required this.polish,
    required this.episodeCreateTime,
    required this.episodeUpdateTime,
  });

  factory ChapterResponse.fromJson(Map<String, dynamic> json) =>
      ChapterResponse(
        id: json['id'],
        novelId: json['novel_id'],
        parentId: json['parent_id'],
        title: json['title'],
        creator: json['creator'],
        describe: json['describe'],
        limitLv: json['limit_lv'],
        cost: json['cost'],
        translator: json['translator'],
        porter: json['porter'],
        proofreader: json['proofreader'],
        polish: json['polish'],
        episodeCreateTime: DateTime.parse(json['episode_create_time']),
        episodeUpdateTime: DateTime.parse(json['episode_update_time']),
      );
}

List<ChapterResponse> chapterResponseFromJson(String str) =>
    List<ChapterResponse>.from(
      json.decode(str).map((x) => ChapterResponse.fromJson(x)),
    );
