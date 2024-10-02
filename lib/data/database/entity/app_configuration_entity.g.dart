// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_configuration_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppConfigurationEntityCollection on Isar {
  IsarCollection<AppConfigurationEntity> get appConfigurationEntitys =>
      this.collection();
}

const AppConfigurationEntitySchema = CollectionSchema(
  name: r'AppConfigurationEntity',
  id: -2861143765048153924,
  properties: {
    r'dbVersion': PropertySchema(
      id: 0,
      name: r'dbVersion',
      type: IsarType.long,
    ),
    r'lastSignInTime': PropertySchema(
      id: 1,
      name: r'lastSignInTime',
      type: IsarType.long,
    ),
    r'themeColor': PropertySchema(
      id: 2,
      name: r'themeColor',
      type: IsarType.long,
    ),
    r'themeMode': PropertySchema(
      id: 3,
      name: r'themeMode',
      type: IsarType.string,
      enumMap: _AppConfigurationEntitythemeModeEnumValueMap,
    )
  },
  estimateSize: _appConfigurationEntityEstimateSize,
  serialize: _appConfigurationEntitySerialize,
  deserialize: _appConfigurationEntityDeserialize,
  deserializeProp: _appConfigurationEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _appConfigurationEntityGetId,
  getLinks: _appConfigurationEntityGetLinks,
  attach: _appConfigurationEntityAttach,
  version: '3.1.0+1',
);

int _appConfigurationEntityEstimateSize(
  AppConfigurationEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.themeMode.name.length * 3;
  return bytesCount;
}

void _appConfigurationEntitySerialize(
  AppConfigurationEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dbVersion);
  writer.writeLong(offsets[1], object.lastSignInTime);
  writer.writeLong(offsets[2], object.themeColor);
  writer.writeString(offsets[3], object.themeMode.name);
}

AppConfigurationEntity _appConfigurationEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppConfigurationEntity(
    dbVersion: reader.readLong(offsets[0]),
    id: id,
    lastSignInTime: reader.readLongOrNull(offsets[1]) ?? 0,
    themeColor: reader.readLongOrNull(offsets[2]) ?? defaultThemeColor,
    themeMode: _AppConfigurationEntitythemeModeValueEnumMap[
            reader.readStringOrNull(offsets[3])] ??
        ThemeMode.system,
  );
  return object;
}

P _appConfigurationEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? defaultThemeColor) as P;
    case 3:
      return (_AppConfigurationEntitythemeModeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ThemeMode.system) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AppConfigurationEntitythemeModeEnumValueMap = {
  r'system': r'system',
  r'light': r'light',
  r'dark': r'dark',
};
const _AppConfigurationEntitythemeModeValueEnumMap = {
  r'system': ThemeMode.system,
  r'light': ThemeMode.light,
  r'dark': ThemeMode.dark,
};

Id _appConfigurationEntityGetId(AppConfigurationEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appConfigurationEntityGetLinks(
    AppConfigurationEntity object) {
  return [];
}

void _appConfigurationEntityAttach(
    IsarCollection<dynamic> col, Id id, AppConfigurationEntity object) {
  object.id = id;
}

extension AppConfigurationEntityQueryWhereSort
    on QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QWhere> {
  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppConfigurationEntityQueryWhere on QueryBuilder<
    AppConfigurationEntity, AppConfigurationEntity, QWhereClause> {
  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppConfigurationEntityQueryFilter on QueryBuilder<
    AppConfigurationEntity, AppConfigurationEntity, QFilterCondition> {
  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> dbVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> dbVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dbVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> dbVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dbVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> dbVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dbVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> lastSignInTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSignInTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> lastSignInTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSignInTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> lastSignInTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSignInTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> lastSignInTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSignInTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeColor',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeColorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeColor',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeColorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeColor',
        value: value,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeModeEqualTo(
    ThemeMode value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeModeGreaterThan(
    ThemeMode value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeModeLessThan(
    ThemeMode value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeModeBetween(
    ThemeMode lower,
    ThemeMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeModeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeModeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
          QAfterFilterCondition>
      themeModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
          QAfterFilterCondition>
      themeModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'themeMode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: '',
      ));
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity,
      QAfterFilterCondition> themeModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'themeMode',
        value: '',
      ));
    });
  }
}

extension AppConfigurationEntityQueryObject on QueryBuilder<
    AppConfigurationEntity, AppConfigurationEntity, QFilterCondition> {}

extension AppConfigurationEntityQueryLinks on QueryBuilder<
    AppConfigurationEntity, AppConfigurationEntity, QFilterCondition> {}

extension AppConfigurationEntityQuerySortBy
    on QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QSortBy> {
  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      sortByDbVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbVersion', Sort.asc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      sortByDbVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbVersion', Sort.desc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      sortByLastSignInTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSignInTime', Sort.asc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      sortByLastSignInTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSignInTime', Sort.desc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      sortByThemeColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.asc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      sortByThemeColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.desc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      sortByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      sortByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }
}

extension AppConfigurationEntityQuerySortThenBy on QueryBuilder<
    AppConfigurationEntity, AppConfigurationEntity, QSortThenBy> {
  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      thenByDbVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbVersion', Sort.asc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      thenByDbVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbVersion', Sort.desc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      thenByLastSignInTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSignInTime', Sort.asc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      thenByLastSignInTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSignInTime', Sort.desc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      thenByThemeColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.asc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      thenByThemeColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.desc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      thenByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QAfterSortBy>
      thenByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }
}

extension AppConfigurationEntityQueryWhereDistinct
    on QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QDistinct> {
  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QDistinct>
      distinctByDbVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dbVersion');
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QDistinct>
      distinctByLastSignInTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSignInTime');
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QDistinct>
      distinctByThemeColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeColor');
    });
  }

  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QDistinct>
      distinctByThemeMode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeMode', caseSensitive: caseSensitive);
    });
  }
}

extension AppConfigurationEntityQueryProperty on QueryBuilder<
    AppConfigurationEntity, AppConfigurationEntity, QQueryProperty> {
  QueryBuilder<AppConfigurationEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppConfigurationEntity, int, QQueryOperations>
      dbVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dbVersion');
    });
  }

  QueryBuilder<AppConfigurationEntity, int, QQueryOperations>
      lastSignInTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSignInTime');
    });
  }

  QueryBuilder<AppConfigurationEntity, int, QQueryOperations>
      themeColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeColor');
    });
  }

  QueryBuilder<AppConfigurationEntity, ThemeMode, QQueryOperations>
      themeModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeMode');
    });
  }
}
