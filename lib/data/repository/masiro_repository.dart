import 'package:injectable/injectable.dart';
import 'package:masiro/data/network/masiro_api.dart';
import 'package:masiro/data/repository/adapter/chapter_detail_response_adapter.dart';
import 'package:masiro/data/repository/adapter/novel_detail_response_adapter.dart';
import 'package:masiro/data/repository/adapter/novel_response_adapter.dart';
import 'package:masiro/data/repository/model/chapter_detail.dart';
import 'package:masiro/data/repository/model/novel.dart';
import 'package:masiro/data/repository/model/novel_detail.dart';
import 'package:masiro/data/repository/model/paged_data.dart';

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

  Future<void> addNovelToFavorites(int novelId, String csrfToken) async {
    await MasiroApi.collectNovel(novelId, csrfToken);
  }

  Future<void> removeNovelFromFavorites(int novelId, String csrfToken) async {
    await MasiroApi.uncollectNovel(novelId, csrfToken);
  }

  Future<PagedData<Novel>> searchNovels({
    String? keyword,
    int? page,
    bool? isOriginal,
  }) async {
    final response = await MasiroApi.searchNovels(
      page: page ?? 1,
      keyword: keyword,
      isOriginal: isOriginal,
    );
    final novels = response.novels.map(novelResponseToNovel).toList();
    return PagedData<Novel>(
      data: novels,
      page: int.parse(response.page),
      totalCount: response.total,
      totalPages: response.pages,
    );
  }
}
