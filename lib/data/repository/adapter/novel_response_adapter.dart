import 'package:masiro/data/network/response/paged_novel_response.dart';
import 'package:masiro/data/repository/model/novel.dart';

Novel novelResponseToNovel(NovelResponse n) {
  return Novel(
    id: n.id,
    title: n.title,
    brief: n.brief,
    rank: n.rank,
    coverImg: n.coverImg,
    author: n.author,
    lastUpdated: n.newUpContent,
    lastUpdatedTime: n.newUpTime,
  );
}
