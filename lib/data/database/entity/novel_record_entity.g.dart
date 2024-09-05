// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel_record_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNovelRecordEntityCollection on Isar {
  IsarCollection<NovelRecordEntity> get novelRecordEntitys => this.collection();
}

const NovelRecordEntitySchema = CollectionSchema(
  name: r'NovelRecordEntity',
  id: 4220778173759774880,
  properties: {},
  estimateSize: _novelRecordEntityEstimateSize,
  serialize: _novelRecordEntitySerialize,
  deserialize: _novelRecordEntityDeserialize,
  deserializeProp: _novelRecordEntityDeserializeProp,
  idName: r'novelId',
  indexes: {},
  links: {
    r'chapterRecords': LinkSchema(
      id: 2521284922654922623,
      name: r'chapterRecords',
      target: r'ChapterRecordEntity',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _novelRecordEntityGetId,
  getLinks: _novelRecordEntityGetLinks,
  attach: _novelRecordEntityAttach,
  version: '3.1.0+1',
);

int _novelRecordEntityEstimateSize(
  NovelRecordEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _novelRecordEntitySerialize(
  NovelRecordEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
NovelRecordEntity _novelRecordEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NovelRecordEntity(
    novelId: id,
  );
  return object;
}

P _novelRecordEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _novelRecordEntityGetId(NovelRecordEntity object) {
  return object.novelId;
}

List<IsarLinkBase<dynamic>> _novelRecordEntityGetLinks(
    NovelRecordEntity object) {
  return [object.chapterRecords];
}

void _novelRecordEntityAttach(
    IsarCollection<dynamic> col, Id id, NovelRecordEntity object) {
  object.novelId = id;
  object.chapterRecords.attach(
      col, col.isar.collection<ChapterRecordEntity>(), r'chapterRecords', id);
}

extension NovelRecordEntityQueryWhereSort
    on QueryBuilder<NovelRecordEntity, NovelRecordEntity, QWhere> {
  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterWhere> anyNovelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NovelRecordEntityQueryWhere
    on QueryBuilder<NovelRecordEntity, NovelRecordEntity, QWhereClause> {
  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterWhereClause>
      novelIdEqualTo(Id novelId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: novelId,
        upper: novelId,
      ));
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterWhereClause>
      novelIdNotEqualTo(Id novelId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: novelId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: novelId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: novelId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: novelId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterWhereClause>
      novelIdGreaterThan(Id novelId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: novelId, includeLower: include),
      );
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterWhereClause>
      novelIdLessThan(Id novelId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: novelId, includeUpper: include),
      );
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterWhereClause>
      novelIdBetween(
    Id lowerNovelId,
    Id upperNovelId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerNovelId,
        includeLower: includeLower,
        upper: upperNovelId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NovelRecordEntityQueryFilter
    on QueryBuilder<NovelRecordEntity, NovelRecordEntity, QFilterCondition> {
  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterFilterCondition>
      novelIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'novelId',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterFilterCondition>
      novelIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'novelId',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterFilterCondition>
      novelIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'novelId',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterFilterCondition>
      novelIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'novelId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NovelRecordEntityQueryObject
    on QueryBuilder<NovelRecordEntity, NovelRecordEntity, QFilterCondition> {}

extension NovelRecordEntityQueryLinks
    on QueryBuilder<NovelRecordEntity, NovelRecordEntity, QFilterCondition> {
  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterFilterCondition>
      chapterRecords(FilterQuery<ChapterRecordEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'chapterRecords');
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterFilterCondition>
      chapterRecordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapterRecords', length, true, length, true);
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterFilterCondition>
      chapterRecordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapterRecords', 0, true, 0, true);
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterFilterCondition>
      chapterRecordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapterRecords', 0, false, 999999, true);
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterFilterCondition>
      chapterRecordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapterRecords', 0, true, length, include);
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterFilterCondition>
      chapterRecordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'chapterRecords', length, include, 999999, true);
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterFilterCondition>
      chapterRecordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'chapterRecords', lower, includeLower, upper, includeUpper);
    });
  }
}

extension NovelRecordEntityQuerySortBy
    on QueryBuilder<NovelRecordEntity, NovelRecordEntity, QSortBy> {}

extension NovelRecordEntityQuerySortThenBy
    on QueryBuilder<NovelRecordEntity, NovelRecordEntity, QSortThenBy> {
  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterSortBy>
      thenByNovelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelId', Sort.asc);
    });
  }

  QueryBuilder<NovelRecordEntity, NovelRecordEntity, QAfterSortBy>
      thenByNovelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelId', Sort.desc);
    });
  }
}

extension NovelRecordEntityQueryWhereDistinct
    on QueryBuilder<NovelRecordEntity, NovelRecordEntity, QDistinct> {}

extension NovelRecordEntityQueryProperty
    on QueryBuilder<NovelRecordEntity, NovelRecordEntity, QQueryProperty> {
  QueryBuilder<NovelRecordEntity, int, QQueryOperations> novelIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'novelId');
    });
  }
}
