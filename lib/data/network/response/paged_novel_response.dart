class PagedNovelResponse {
  int code;
  String msg;
  List<NovelResponse> novels;
  String page;
  int pages;
  int total;

  PagedNovelResponse({
    required this.code,
    required this.msg,
    required this.novels,
    required this.page,
    required this.pages,
    required this.total,
  });

  factory PagedNovelResponse.fromJson(Map<String, dynamic> json) {
    return PagedNovelResponse(
      code: json['code'],
      msg: json['msg'],
      novels: (json['novels'] as List<dynamic>)
          .map((e) => NovelResponse.fromJson(e))
          .toList(),
      page: json['page'],
      pages: json['pages'],
      total: json['total'],
    );
  }
}

class NovelResponse {
  int id;
  String title;
  String brief;
  int rank;
  String coverImg;
  String? author;
  String? newUpTime;
  String? newUpContent;

  NovelResponse({
    required this.id,
    required this.title,
    required this.brief,
    required this.rank,
    required this.coverImg,
    required this.author,
    required this.newUpTime,
    required this.newUpContent,
  });

  factory NovelResponse.fromJson(Map<String, dynamic> json) {
    return NovelResponse(
      id: json['id'],
      title: json['title'],
      brief: json['brief'],
      rank: json['rank'],
      coverImg: json['cover_img'],
      author: json['author'],
      newUpTime: json['new_up_time'],
      newUpContent: json['new_up_content'],
    );
  }
}
