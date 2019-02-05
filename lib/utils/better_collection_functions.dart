List<T> betterMap<T>(List<T> list, T func(T value, int index, List<T> list)) {
  final result = new List<T>();

  for (var i = 0; i < list.length; i++) {
    result.add(func(list[i], i, list));
  }

  return result;
}
