import 'package:dio/dio.dart';
import 'package:masiro/data/network/response/chapter_detail_response.dart';
import 'package:masiro/data/network/response/common_response.dart';
import 'package:masiro/data/network/response/novel_detail_response.dart';
import 'package:masiro/data/network/response/paged_novel_response.dart';
import 'package:masiro/data/network/response/profile_response.dart';
import 'package:masiro/di/get_it.dart';
import 'package:masiro/misc/url.dart';

class MasiroApi {
  static final _dio = getIt<Dio>();

  static Future<PagedNovelResponse> getPagedNovelCollection({
    required int page,
    int collection = 1,
  }) async {
    final response = await _dio.get(
      MasiroUrl.loadMoreNovels,
      queryParameters: {'page': page, 'collection': collection},
      options: Options(headers: {'Referer': MasiroUrl.collectionUrl}),
    );
    return PagedNovelResponse.fromJson(response.data);
  }

  static Future<NovelDetailResponse> getNovelDetail(int novelId) async {
    final response = await _dio.get(
      MasiroUrl.novelViewUrl,
      queryParameters: {'novel_id': novelId},
    );
    return NovelDetailResponse.fromHtml(response.data);
  }

  static Future<ChapterDetailResponse> getChapterDetail(
    int novelId,
    int chapterId,
  ) async {
    final response = await _dio.get(
      MasiroUrl.novelReadingUrl,
      queryParameters: {'cid': chapterId},
      options: Options(
        headers: {
          'Referer': 'https://masiro.me/admin/novelView?novel_id=$novelId',
        },
      ),
    );
    return ChapterDetailResponse.fromHtml(response.data);
  }

  static Future<void> collectNovel(int novelId, String csrfToken) async {
    await _dio.get(
      MasiroUrl.collectNovel,
      queryParameters: {'novel_id': novelId},
      options: Options(
        headers: {
          'Referer': 'https://masiro.me/admin/novelView?novel_id=$novelId',
          'X-CSRF-TOKEN': csrfToken,
          'X-Requested-With': 'XMLHttpRequest',
        },
      ),
    );
  }

  static Future<void> uncollectNovel(int novelId, String csrfToken) async {
    await _dio.get(
      MasiroUrl.uncollectNovel,
      queryParameters: {'novel_id': novelId},
      options: Options(
        headers: {
          'Referer': 'https://masiro.me/admin/novelView?novel_id=$novelId',
          'X-CSRF-TOKEN': csrfToken,
          'X-Requested-With': 'XMLHttpRequest',
        },
      ),
    );
  }

  static Future<PagedNovelResponse> searchNovels({
    String? keyword,
    int? page,
    bool? isOriginal,
  }) async {
    final Map<String, dynamic> params = {};

    if (keyword != null) {
      params['keyword'] = keyword;
    }

    if (page != null) {
      params['page'] = page;
    }

    if (isOriginal != null) {
      params['ori'] = isOriginal ? 1 : 0;
    }

    final response = await _dio.get(
      MasiroUrl.loadMoreNovels,
      queryParameters: params,
      options: Options(headers: {'Referer': MasiroUrl.novelsUrl}),
    );

    return PagedNovelResponse.fromJson(response.data);
  }

  static Future<CommonResponse> pay({
    required int chapterId,
    required int cost,
    required int type,
    required String csrfToken,
  }) async {
    final response = await _dio.post(
      MasiroUrl.pay,
      data: {'type': '$type', 'object_id': '$chapterId', 'cost': '$cost'},
      options: Options(
        headers: {
          'Referer': 'https://masiro.me/admin/novelReading?cid=$chapterId',
          'X-CSRF-TOKEN': csrfToken,
          'X-Requested-With': 'XMLHttpRequest',
        },
      ),
    );
    return CommonResponse.fromJson(response.data);
  }

  static Future<ProfileResponse> getProfile() async {
    final response = await _dio.get(MasiroUrl.adminUrl);
    return ProfileResponse.fromHtml(response.data);
  }

  static Future<CommonResponse> dailySignIn() async {
    final response = await _dio.get(
      MasiroUrl.dailySignIn,
      options: Options(
        headers: {
          'Referer': MasiroUrl.adminUrl,
          'X-Requested-With': 'XMLHttpRequest',
        },
      ),
    );
    return CommonResponse.fromJson(response.data);
  }
}
