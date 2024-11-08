import 'package:injectable/injectable.dart';
import 'package:masiro/data/network/masiro_api.dart';
import 'package:masiro/data/repository/adapter/chapter_detail_response_adapter.dart';
import 'package:masiro/data/repository/adapter/comment_response_adapter.dart';
import 'package:masiro/data/repository/adapter/novel_detail_response_adapter.dart';
import 'package:masiro/data/repository/adapter/novel_response_adapter.dart';
import 'package:masiro/data/repository/adapter/profile_response_adapter.dart';
import 'package:masiro/data/repository/model/chapter_detail.dart';
import 'package:masiro/data/repository/model/comment.dart';
import 'package:masiro/data/repository/model/novel.dart';
import 'package:masiro/data/repository/model/novel_detail.dart';
import 'package:masiro/data/repository/model/paged_data.dart';
import 'package:masiro/data/repository/model/profile.dart';

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

  Future<String> purchasePaidChapter({
    required int chapterId,
    required int cost,
    required int type,
    required String csrfToken,
  }) async {
    final response = await MasiroApi.pay(
      chapterId: chapterId,
      cost: cost,
      type: type,
      csrfToken: csrfToken,
    );
    return response.code == 1 ? response.msg : throw Exception(response.msg);
  }

  Future<Profile> getProfile() async {
    final response = await MasiroApi.getProfile();
    return profileResponseToProfile(response);
  }

  Future<String> signIn() async {
    final response = await MasiroApi.dailySignIn();
    return response.msg;
  }

  Future<PagedData<Comment>> getChapterComments({
    required int chapterId,
    required int page,
    required int pageSize,
  }) async {
    final response = await MasiroApi.getChapterComments(
      chapterId: chapterId,
      page: page,
      pageSize: pageSize,
    );
    return pagedCommentResponseToModel(response, page, pageSize);
  }

  Future<PagedData<Comment>> getNovelComments({
    required int novelId,
    required int page,
    required int pageSize,
  }) async {
    final response = await MasiroApi.getNovelComments(
      novelId: novelId,
      page: page,
      pageSize: pageSize,
    );
    return pagedCommentResponseToModel(response, page, pageSize);
  }
}
