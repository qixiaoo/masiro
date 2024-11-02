import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/user.dart';

class UserState extends Equatable {
  final User? currentUser;
  final List<User> userList;

  const UserState({
    this.currentUser,
    this.userList = const [],
  });

  UserState copyWith({
    User? currentUser,
    List<User>? userList,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
      userList: userList ?? this.userList,
    );
  }

  @override
  List<Object?> get props => [
        currentUser,
        userList,
      ];
}
