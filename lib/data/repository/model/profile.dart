import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int id;
  final String name;
  final int level;
  final String avatar;
  final int coinCount;
  final int fanCount;

  const Profile({
    required this.id,
    required this.name,
    required this.level,
    required this.avatar,
    required this.coinCount,
    required this.fanCount,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        level,
        avatar,
        coinCount,
        fanCount,
      ];
}
