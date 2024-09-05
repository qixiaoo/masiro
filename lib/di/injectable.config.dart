// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i4;

import '../data/database/dao/chapter_record_dao.dart' as _i3;
import '../data/repository/masiro_repository.dart' as _i5;
import '../data/repository/novel_record_repository.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ChapterRecordDao>(
        () => _i3.ChapterRecordDao(isar: gh<_i4.Isar>()));
    gh.lazySingleton<_i5.MasiroRepository>(() => _i5.MasiroRepository());
    gh.factory<_i6.NovelRecordRepository>(() => _i6.NovelRecordRepository());
    return this;
  }
}
