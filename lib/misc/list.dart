List<U> indexedMap<T, U>(
  List<T> list,
  U Function(int index, T element) mapper,
) {
  final result = <U>[];
  for (var i = 0; i < list.length; i++) {
    result.add(mapper(i, list[i]));
  }
  return result;
}
