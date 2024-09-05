import 'package:injectable/injectable.dart';
import 'package:masiro/data/model/chapter_detail.dart';
import 'package:masiro/data/model/novel.dart';
import 'package:masiro/data/model/novel_detail.dart';
import 'package:masiro/data/network/masiro_api.dart';
import 'package:masiro/data/repository/adapter/chapter_detail_response_adapter.dart';
import 'package:masiro/data/repository/adapter/novel_detail_response_adapter.dart';
import 'package:masiro/data/repository/adapter/novel_response_adapter.dart';

// TODO(qixiao): Create error handlers or interceptors to globally handle errors.

@lazySingleton
class MasiroRepository {
  Future<List<Novel>> getFavorites() async {
    final firstPage = await MasiroApi.getPagedNovelCollection(page: 1);
    final total = firstPage.pages;
    if (total == 1) {
      return firstPage.novels.map(novelResponseToNovel).toList();
    }

    // Fetch all pages if the total number is more than one.
    final List<Novel> allNovels = [];
    for (var number = 2; number <= total; number++) {
      final nextPage = await MasiroApi.getPagedNovelCollection(page: number);
      allNovels.addAll(nextPage.novels.map(novelResponseToNovel));
    }

    return allNovels;
  }

  Future<NovelDetail> getNovelDetail(int novelId) async {
    final response = await MasiroApi.getNovelDetail(novelId);
    return novelDetailResponseToNovelDetail(response);
  }

  Future<ChapterDetail> getChapterDetail(int novelId, int chapterId) async {
    final response = await MasiroApi.getChapterDetail(novelId, chapterId);
    return chapterDetailResponseToChapterDetail(response);
  }
}
