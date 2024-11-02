import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:masiro/data/database/entity/current_cookie_entity.dart';
import 'package:masiro/data/database/entity/user_entity.dart';
import 'package:masiro/di/get_it.dart';
import 'package:masiro/misc/constant.dart';

@singleton
class UserDao {
  final Isar _isar = getIt<Isar>();

  Future<UserEntity?> getUser(int userId) async {
    return _isar.userEntitys.filter().userIdEqualTo(userId).findFirst();
  }

  Future<Id> putUser(UserEntity entity) async {
    return _isar.writeTxn(() async {
      return _isar.userEntitys.put(entity);
    });
  }

  Future<bool> deleteUser(int userId) async {
    return _isar.writeTxn(() async {
      return _isar.userEntitys.delete(userId);
    });
  }

  Future<List<UserEntity>> getUserList() async {
    return _isar.userEntitys.where().findAll();
  }

  Future<UserEntity?> getCurrentUser() async {
    final currentCookie = await getCurrentCookie();
    if (currentCookie == null) {
      return null;
    }
    return getUser(currentCookie.userId);
  }

  Future<CurrentCookieEntity?> getCurrentCookie() async {
    return _isar.currentCookieEntitys.where().limit(1).findFirst();
  }

  Future<Id> putCurrentCookie(CurrentCookieEntity entity) async {
    final currentCookie = await getCurrentCookie();
    return _isar.writeTxn(() async {
      return _isar.currentCookieEntitys.put(
        entity.copyWith(
          id: currentCookie?.id ?? entity.id,
        ),
      );
    });
  }

  Future<void> clearCurrentCookie() async {
    return _isar.writeTxn(() async {
      return _isar.currentCookieEntitys.clear();
    });
  }

  Future<String?> getCurrentUserCookie(String key) async {
    final currentCookie = await getCurrentCookie();
    return currentCookie?.cookieList
        .where((item) => item.key == key)
        .firstOrNull
        ?.value;
  }

  Future<void> putCurrentUserCookie(String key, String? value) async {
    final currentCookie = await getCurrentCookie();
    final cookies = currentCookie?.cookieList ?? [];
    final filteredCookies = cookies.where((item) => item.key != key).toList();

    if (value != null) {
      filteredCookies.add(keyValuePair(key, value));
    }

    final updatedCurrentCookie = CurrentCookieEntity(
      id: currentCookie?.id ?? Isar.autoIncrement,
      userId: currentCookie?.userId ?? defaultUserId,
      cookieList: filteredCookies,
    );

    final currentUser = await getUser(updatedCurrentCookie.userId);

    await _isar.writeTxn(() async {
      await _isar.currentCookieEntitys.put(updatedCurrentCookie);

      if (currentUser != null) {
        await _isar.userEntitys.put(
          currentUser.copyWith(cookieList: filteredCookies),
        );
      }
    });
  }
}
