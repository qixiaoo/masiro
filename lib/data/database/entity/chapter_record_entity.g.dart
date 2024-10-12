// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_record_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChapterRecordEntityCollection on Isar {
  IsarCollection<ChapterRecordEntity> get chapterRecordEntitys =>
      this.collection();
}

const ChapterRecordEntitySchema = CollectionSchema(
  name: r'ChapterRecordEntity',
  id: -5790159902217085605,
  properties: {
    r'chapterId': PropertySchema(
      id: 0,
      name: r'chapterId',
      type: IsarType.long,
    ),
    r'novelId': PropertySchema(
      id: 1,
      name: r'novelId',
      type: IsarType.long,
    ),
    r'positionJson': PropertySchema(
      id: 2,
      name: r'positionJson',
      type: IsarType.string,
    ),
    r'progress': PropertySchema(
      id: 3,
      name: r'progress',
      type: IsarType.long,
    ),
    r'readingMode': PropertySchema(
      id: 4,
      name: r'readingMode',
      type: IsarType.string,
      enumMap: _ChapterRecordEntityreadingModeEnumValueMap,
    )
  },
  estimateSize: _chapterRecordEntityEstimateSize,
  serialize: _chapterRecordEntitySerialize,
  deserialize: _chapterRecordEntityDeserialize,
  deserializeProp: _chapterRecordEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'chapterId': IndexSchema(
      id: -1917949875430644359,
      name: r'chapterId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'chapterId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'novelId': IndexSchema(
      id: 5691757736292369527,
      name: r'novelId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'novelId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _chapterRecordEntityGetId,
  getLinks: _chapterRecordEntityGetLinks,
  attach: _chapterRecordEntityAttach,
  version: '3.1.0+1',
);

int _chapterRecordEntityEstimateSize(
  ChapterRecordEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.positionJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.readingMode.name.length * 3;
  return bytesCount;
}

void _chapterRecordEntitySerialize(
  ChapterRecordEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.chapterId);
  writer.writeLong(offsets[1], object.novelId);
  writer.writeString(offsets[2], object.positionJson);
  writer.writeLong(offsets[3], object.progress);
  writer.writeString(offsets[4], object.readingMode.name);
}

ChapterRecordEntity _chapterRecordEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChapterRecordEntity(
    chapterId: reader.readLong(offsets[0]),
    id: id,
    novelId: reader.readLong(offsets[1]),
    positionJson: reader.readStringOrNull(offsets[2]),
    progress: reader.readLong(offsets[3]),
    readingMode: _ChapterRecordEntityreadingModeValueEnumMap[
            reader.readStringOrNull(offsets[4])] ??
        ChapterReadingMode.page,
  );
  return object;
}

P _chapterRecordEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (_ChapterRecordEntityreadingModeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ChapterReadingMode.page) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ChapterRecordEntityreadingModeEnumValueMap = {
  r'page': r'page',
  r'scroll': r'scroll',
};
const _ChapterRecordEntityreadingModeValueEnumMap = {
  r'page': ChapterReadingMode.page,
  r'scroll': ChapterReadingMode.scroll,
};

Id _chapterRecordEntityGetId(ChapterRecordEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chapterRecordEntityGetLinks(
    ChapterRecordEntity object) {
  return [];
}

void _chapterRecordEntityAttach(
    IsarCollection<dynamic> col, Id id, ChapterRecordEntity object) {
  object.id = id;
}

extension ChapterRecordEntityQueryWhereSort
    on QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QWhere> {
  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhere>
      anyChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'chapterId'),
      );
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhere>
      anyNovelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'novelId'),
      );
    });
  }
}

extension ChapterRecordEntityQueryWhere
    on QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QWhereClause> {
  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
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

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
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

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      chapterIdEqualTo(int chapterId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'chapterId',
        value: [chapterId],
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      chapterIdNotEqualTo(int chapterId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'chapterId',
              lower: [],
              upper: [chapterId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'chapterId',
              lower: [chapterId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'chapterId',
              lower: [chapterId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'chapterId',
              lower: [],
              upper: [chapterId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      chapterIdGreaterThan(
    int chapterId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'chapterId',
        lower: [chapterId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      chapterIdLessThan(
    int chapterId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'chapterId',
        lower: [],
        upper: [chapterId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      chapterIdBetween(
    int lowerChapterId,
    int upperChapterId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'chapterId',
        lower: [lowerChapterId],
        includeLower: includeLower,
        upper: [upperChapterId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      novelIdEqualTo(int novelId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'novelId',
        value: [novelId],
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      novelIdNotEqualTo(int novelId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelId',
              lower: [],
              upper: [novelId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelId',
              lower: [novelId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelId',
              lower: [novelId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelId',
              lower: [],
              upper: [novelId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      novelIdGreaterThan(
    int novelId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'novelId',
        lower: [novelId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      novelIdLessThan(
    int novelId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'novelId',
        lower: [],
        upper: [novelId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterWhereClause>
      novelIdBetween(
    int lowerNovelId,
    int upperNovelId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'novelId',
        lower: [lowerNovelId],
        includeLower: includeLower,
        upper: [upperNovelId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChapterRecordEntityQueryFilter on QueryBuilder<ChapterRecordEntity,
    ChapterRecordEntity, QFilterCondition> {
  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      chapterIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chapterId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      chapterIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chapterId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      chapterIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chapterId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      chapterIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chapterId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
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

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
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

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
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

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      novelIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'novelId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      novelIdGreaterThan(
    int value, {
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

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      novelIdLessThan(
    int value, {
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

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      novelIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'positionJson',
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'positionJson',
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'positionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'positionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'positionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'positionJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'positionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'positionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'positionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'positionJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'positionJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      positionJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'positionJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      progressEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progress',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      progressGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progress',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      progressLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progress',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      progressBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      readingModeEqualTo(
    ChapterReadingMode value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readingMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      readingModeGreaterThan(
    ChapterReadingMode value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'readingMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      readingModeLessThan(
    ChapterReadingMode value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'readingMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      readingModeBetween(
    ChapterReadingMode lower,
    ChapterReadingMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'readingMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      readingModeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'readingMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      readingModeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'readingMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      readingModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'readingMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      readingModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'readingMode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      readingModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readingMode',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterFilterCondition>
      readingModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'readingMode',
        value: '',
      ));
    });
  }
}

extension ChapterRecordEntityQueryObject on QueryBuilder<ChapterRecordEntity,
    ChapterRecordEntity, QFilterCondition> {}

extension ChapterRecordEntityQueryLinks on QueryBuilder<ChapterRecordEntity,
    ChapterRecordEntity, QFilterCondition> {}

extension ChapterRecordEntityQuerySortBy
    on QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QSortBy> {
  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      sortByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      sortByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      sortByNovelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelId', Sort.asc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      sortByNovelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelId', Sort.desc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      sortByPositionJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'positionJson', Sort.asc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      sortByPositionJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'positionJson', Sort.desc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      sortByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      sortByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      sortByReadingMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingMode', Sort.asc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      sortByReadingModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingMode', Sort.desc);
    });
  }
}

extension ChapterRecordEntityQuerySortThenBy
    on QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QSortThenBy> {
  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenByNovelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelId', Sort.asc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenByNovelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelId', Sort.desc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenByPositionJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'positionJson', Sort.asc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenByPositionJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'positionJson', Sort.desc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenByReadingMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingMode', Sort.asc);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QAfterSortBy>
      thenByReadingModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingMode', Sort.desc);
    });
  }
}

extension ChapterRecordEntityQueryWhereDistinct
    on QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QDistinct> {
  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QDistinct>
      distinctByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterId');
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QDistinct>
      distinctByNovelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'novelId');
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QDistinct>
      distinctByPositionJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'positionJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QDistinct>
      distinctByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progress');
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QDistinct>
      distinctByReadingMode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'readingMode', caseSensitive: caseSensitive);
    });
  }
}

extension ChapterRecordEntityQueryProperty
    on QueryBuilder<ChapterRecordEntity, ChapterRecordEntity, QQueryProperty> {
  QueryBuilder<ChapterRecordEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChapterRecordEntity, int, QQueryOperations> chapterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterId');
    });
  }

  QueryBuilder<ChapterRecordEntity, int, QQueryOperations> novelIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'novelId');
    });
  }

  QueryBuilder<ChapterRecordEntity, String?, QQueryOperations>
      positionJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'positionJson');
    });
  }

  QueryBuilder<ChapterRecordEntity, int, QQueryOperations> progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progress');
    });
  }

  QueryBuilder<ChapterRecordEntity, ChapterReadingMode, QQueryOperations>
      readingModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readingMode');
    });
  }
}
