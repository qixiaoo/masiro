import 'package:injectable/injectable.dart';
import 'package:masiro/data/repository/masiro_repository.dart';
import 'package:masiro/data/repository/model/novel.dart';
import 'package:masiro/di/get_it.dart';

@lazySingleton
class FavoritesRepository {
  final _masiroRepository = getIt<MasiroRepository>();

  List<Novel>? _cachedFavorites;

  bool _needsRefresh = false;

  Future<List<Novel>> getFavorites() async {
    if (_needsRefresh) {
      return refreshFavorites();
    }
    if (_cachedFavorites != null) {
      return List.from(_cachedFavorites!);
    }
    _cachedFavorites = await _masiroRepository.getFavorites();
    return List.from(_cachedFavorites!);
  }

  Future<List<Novel>> refreshFavorites() async {
    _cachedFavorites = await _masiroRepository.getFavorites();
    _needsRefresh = false;
    return List.from(_cachedFavorites!);
  }

  Future<void> addToFavorites(int novelId, String csrfToken) async {
    await _masiroRepository.addNovelToFavorites(novelId, csrfToken);
    _needsRefresh = true;
  }

  Future<void> removeFromFavorites(int novelId, String csrfToken) async {
    await _masiroRepository.removeNovelFromFavorites(novelId, csrfToken);
    _cachedFavorites?.removeWhere((novel) => novel.id == novelId);
  }

  void setNeedsRefresh(bool needsRefresh) {
    _needsRefresh = needsRefresh;
  }
}
