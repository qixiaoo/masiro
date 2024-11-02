import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/user.dart';

sealed class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class UserInitialized extends UserEvent {}

final class UserSignedIn extends UserEvent {}

final class UserSwitched extends UserEvent {
  final User user;

  UserSwitched({required this.user});

  @override
  List<Object> get props => [user];
}
