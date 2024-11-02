import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int userId;
  final String userName;
  final int lastSignInTime;

  const User({
    required this.userId,
    required this.userName,
    required this.lastSignInTime,
  });

  User copyWith({
    int? userId,
    String? userName,
    int? lastSignInTime,
  }) {
    return User(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      lastSignInTime: lastSignInTime ?? this.lastSignInTime,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        userName,
        lastSignInTime,
      ];
}
