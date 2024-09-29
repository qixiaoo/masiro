import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

class AppConfiguration extends Equatable {
  final Id id;
  final int dbVersion;
  final int lastSignInTime;

  const AppConfiguration({
    required this.id,
    required this.dbVersion,
    required this.lastSignInTime,
  });

  AppConfiguration copyWith({
    Id? id,
    int? dbVersion,
    int? lastSignInTime,
  }) {
    return AppConfiguration(
      id: id ?? this.id,
      dbVersion: dbVersion ?? this.dbVersion,
      lastSignInTime: lastSignInTime ?? this.lastSignInTime,
    );
  }

  @override
  List<Object?> get props => [
        id,
        dbVersion,
        lastSignInTime,
      ];
}
