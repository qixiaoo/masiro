import 'package:masiro/data/database/entity/user_entity.dart';
import 'package:masiro/data/repository/model/user.dart';

User userEntityToModel(UserEntity entity) {
  return User(
    userId: entity.userId,
    userName: entity.userName,
    lastSignInTime: entity.lastSignInTime,
  );
}
