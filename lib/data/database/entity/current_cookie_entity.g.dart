// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_cookie_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCurrentCookieEntityCollection on Isar {
  IsarCollection<CurrentCookieEntity> get currentCookieEntitys =>
      this.collection();
}

const CurrentCookieEntitySchema = CollectionSchema(
  name: r'CurrentCookieEntity',
  id: -1169743838362205729,
  properties: {
    r'cookieList': PropertySchema(
      id: 0,
      name: r'cookieList',
      type: IsarType.objectList,
      target: r'KeyValuePair',
    ),
    r'userId': PropertySchema(
      id: 1,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _currentCookieEntityEstimateSize,
  serialize: _currentCookieEntitySerialize,
  deserialize: _currentCookieEntityDeserialize,
  deserializeProp: _currentCookieEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'KeyValuePair': KeyValuePairSchema},
  getId: _currentCookieEntityGetId,
  getLinks: _currentCookieEntityGetLinks,
  attach: _currentCookieEntityAttach,
  version: '3.1.0+1',
);

int _currentCookieEntityEstimateSize(
  CurrentCookieEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cookieList.length * 3;
  {
    final offsets = allOffsets[KeyValuePair]!;
    for (var i = 0; i < object.cookieList.length; i++) {
      final value = object.cookieList[i];
      bytesCount += KeyValuePairSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _currentCookieEntitySerialize(
  CurrentCookieEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<KeyValuePair>(
    offsets[0],
    allOffsets,
    KeyValuePairSchema.serialize,
    object.cookieList,
  );
  writer.writeLong(offsets[1], object.userId);
}

CurrentCookieEntity _currentCookieEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CurrentCookieEntity(
    cookieList: reader.readObjectList<KeyValuePair>(
          offsets[0],
          KeyValuePairSchema.deserialize,
          allOffsets,
          KeyValuePair(),
        ) ??
        const [],
    id: id,
    userId: reader.readLong(offsets[1]),
  );
  return object;
}

P _currentCookieEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<KeyValuePair>(
            offset,
            KeyValuePairSchema.deserialize,
            allOffsets,
            KeyValuePair(),
          ) ??
          const []) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _currentCookieEntityGetId(CurrentCookieEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _currentCookieEntityGetLinks(
    CurrentCookieEntity object) {
  return [];
}

void _currentCookieEntityAttach(
    IsarCollection<dynamic> col, Id id, CurrentCookieEntity object) {
  object.id = id;
}

extension CurrentCookieEntityQueryWhereSort
    on QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QWhere> {
  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhere>
      anyUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userId'),
      );
    });
  }
}

extension CurrentCookieEntityQueryWhere
    on QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QWhereClause> {
  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhereClause>
      userIdEqualTo(int userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhereClause>
      userIdNotEqualTo(int userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhereClause>
      userIdGreaterThan(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [userId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhereClause>
      userIdLessThan(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [],
        upper: [userId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterWhereClause>
      userIdBetween(
    int lowerUserId,
    int upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [lowerUserId],
        includeLower: includeLower,
        upper: [upperUserId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CurrentCookieEntityQueryFilter on QueryBuilder<CurrentCookieEntity,
    CurrentCookieEntity, QFilterCondition> {
  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      cookieListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cookieList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      cookieListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cookieList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      cookieListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cookieList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      cookieListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cookieList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      cookieListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cookieList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      cookieListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cookieList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CurrentCookieEntityQueryObject on QueryBuilder<CurrentCookieEntity,
    CurrentCookieEntity, QFilterCondition> {
  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterFilterCondition>
      cookieListElement(FilterQuery<KeyValuePair> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'cookieList');
    });
  }
}

extension CurrentCookieEntityQueryLinks on QueryBuilder<CurrentCookieEntity,
    CurrentCookieEntity, QFilterCondition> {}

extension CurrentCookieEntityQuerySortBy
    on QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QSortBy> {
  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension CurrentCookieEntityQuerySortThenBy
    on QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QSortThenBy> {
  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension CurrentCookieEntityQueryWhereDistinct
    on QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QDistinct> {
  QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension CurrentCookieEntityQueryProperty
    on QueryBuilder<CurrentCookieEntity, CurrentCookieEntity, QQueryProperty> {
  QueryBuilder<CurrentCookieEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CurrentCookieEntity, List<KeyValuePair>, QQueryOperations>
      cookieListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cookieList');
    });
  }

  QueryBuilder<CurrentCookieEntity, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
