import 'package:masiro/data/model/novel.dart';
import 'package:masiro/data/network/response/novel_collection_response.dart';

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
