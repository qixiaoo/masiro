import 'package:cookie_jar/cookie_jar.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:masiro/data/database/dao/user_dao.dart';
import 'package:masiro/data/database/entity/current_cookie_entity.dart';
import 'package:masiro/data/database/entity/user_entity.dart';
import 'package:masiro/data/repository/adapter/user_entity_adapter.dart';
import 'package:masiro/data/repository/model/user.dart';
import 'package:masiro/data/repository/profile_repository.dart';
import 'package:masiro/di/get_it.dart';
import 'package:masiro/misc/cookie.dart';
import 'package:masiro/misc/url.dart';

@lazySingleton
class UserRepository {
  final _logger = getIt<Logger>();
  final _userDao = getIt<UserDao>();
  final _profileRepository = getIt<ProfileRepository>();

  Future<bool> deleteUser(int userId) async {
    return _userDao.deleteUser(userId);
  }

  Future<List<User>> getUserList() async {
    final entityList = await _userDao.getUserList();
    return entityList.map((entity) => userEntityToModel(entity)).toList();
  }

  Future<User?> getCurrentUser() async {
    final entity = await _userDao.getCurrentUser();
    if (entity == null) {
      return null;
    }
    return userEntityToModel(entity);
  }

  Future<void> setCurrentUserLastSignInTime(int lastSignInTime) async {
    final entity = await _userDao.getCurrentUser();
    if (entity == null) {
      return;
    }
    await _userDao.putUser(entity.copyWith(lastSignInTime: lastSignInTime));
  }

  Future<void> clearCurrentCookie() async {
    return _userDao.clearCurrentCookie();
  }

  Future<void> switchCurrentUser(int userId) async {
    final targetUser = await _userDao.getUser(userId);
    if (targetUser == null) {
      _logger.w('''The target user $userId doesn't exist.''');
      return;
    }

    await _userDao.clearCurrentCookie();
    await _userDao.putCurrentCookie(
      CurrentCookieEntity(
        userId: userId,
        cookieList: targetUser.cookieList,
      ),
    );
    await resetCookieManager();
  }

  /// Sets the [cookies] as the current cookies to be used by `dio` requests.
  /// Also, requests and saves the current user information into the database.
  Future<void> saveCurrentCookieAndUser(List<Cookie> cookies) async {
    await _userDao.clearCurrentCookie();
    await resetCookieManager();

    // The `cookieJar.saveFromResponse` method will insert a new
    // `CurrentCookieEntity` with a default `userId` of `-1` into the database.
    final cookieJar = await getCookieJar();
    await cookieJar.saveFromResponse(Uri.parse(MasiroUrl.baseUrl), cookies);

    final currentCookie = await _userDao.getCurrentCookie();
    if (currentCookie == null) {
      _logger.w('''The current cookie entity doesn't exist.''');
      return;
    }

    final profile = await _profileRepository.refreshProfile();
    final userId = profile.id;
    final userName = profile.name;
    final currentUser = await _userDao.getUser(userId) ??
        UserEntity(
          userId: userId,
          userName: userName,
        );
    await _userDao.putUser(
      currentUser.copyWith(
        cookieList: currentCookie.cookieList,
      ),
    );
    await _userDao.putCurrentCookie(currentCookie.copyWith(userId: userId));
  }
}
