import 'package:isar/isar.dart';

part 'user_entity.g.dart';

@collection
class UserEntity {
  @Index()
  Id userId;

  String userName;

  List<KeyValuePair> cookieList;

  int lastSignInTime;

  UserEntity({
    required this.userId,
    required this.userName,
    this.cookieList = const [],
    this.lastSignInTime = 0,
  });

  UserEntity copyWith({
    int? userId,
    String? userName,
    List<KeyValuePair>? cookieList,
    int? lastSignInTime,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      cookieList: cookieList ?? this.cookieList,
      lastSignInTime: lastSignInTime ?? this.lastSignInTime,
    );
  }
}

@embedded
class KeyValuePair {
  late String key;
  late String value;
}

KeyValuePair keyValuePair(String key, String value) {
  final pair = KeyValuePair();
  pair.key = key;
  pair.value = value;
  return pair;
}
