import 'package:injectable/injectable.dart';
import 'package:masiro/data/repository/masiro_repository.dart';
import 'package:masiro/data/repository/model/profile.dart';
import 'package:masiro/di/get_it.dart';

@lazySingleton
class ProfileRepository {
  final _masiroRepository = getIt<MasiroRepository>();

  Profile? _cachedProfile;

  bool _needsRefresh = false;

  Future<Profile> getProfile() async {
    if (_needsRefresh) {
      return refreshProfile();
    }
    if (_cachedProfile != null) {
      return _cachedProfile!;
    }
    _cachedProfile = await _masiroRepository.getProfile();
    return _cachedProfile!;
  }

  Future<Profile> refreshProfile() async {
    _cachedProfile = await _masiroRepository.getProfile();
    _needsRefresh = false;
    return _cachedProfile!;
  }

  void setNeedsRefresh(bool needsRefresh) {
    _needsRefresh = needsRefresh;
  }
}
