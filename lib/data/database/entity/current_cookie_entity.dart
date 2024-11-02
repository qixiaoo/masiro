import 'package:isar/isar.dart';
import 'package:masiro/data/database/entity/user_entity.dart';

part 'current_cookie_entity.g.dart';

@collection
class CurrentCookieEntity {
  Id id;

  @Index()
  int userId;

  List<KeyValuePair> cookieList;

  CurrentCookieEntity({
    this.id = Isar.autoIncrement,
    required this.userId,
    this.cookieList = const [],
  });

  CurrentCookieEntity copyWith({
    Id? id,
    int? userId,
    List<KeyValuePair>? cookieList,
  }) {
    return CurrentCookieEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      cookieList: cookieList ?? this.cookieList,
    );
  }
}
