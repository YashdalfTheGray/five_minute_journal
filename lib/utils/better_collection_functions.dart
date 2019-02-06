List<T> betterMap<T>(List<T> list, T func(T value, int index, List<T> list)) {
  final result = new List<T>();

  for (int i = 0; i < list.length; i++) {
    result.add(func(list[i], i, list));
  }

  return result;
}

List<T> filter<T>(List<T> list, bool tester(T value, int index, List<T> list)) {
  final result = new List<T>();

  for (int i = 0; i < list.length; i++) {
    if (tester(list[i], i, list)) {
      result.add(list[i]);
    }
  }

  return result;
}

U betterReduce<T, U>(
    List<T> list, U reducer(U accumulator, T value, int index, List<T> list),
    [U initial]) {
  U accumulator = initial == null ? null : initial;

  for (int i = 0; i < list.length; i++) {
    if (accumulator != null) {
      accumulator = reducer(accumulator, list[i], i, list);
    } else {
      accumulator = list[i] as U;
    }
  }

  return accumulator;
}
