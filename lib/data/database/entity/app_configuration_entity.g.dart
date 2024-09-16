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
  return bytesCount;
}

void _appConfigurationEntitySerialize(
  AppConfigurationEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dbVersion);
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

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
}

extension AppConfigurationEntityQueryWhereDistinct
    on QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QDistinct> {
  QueryBuilder<AppConfigurationEntity, AppConfigurationEntity, QDistinct>
      distinctByDbVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dbVersion');
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
}
