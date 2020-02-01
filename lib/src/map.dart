part of dartx;

extension MapX<K, V> on Map<K, V> {
  /// Return merged Map by [reduce] reducer
  Map<K, V> mergeWith(Map<K, V> other, {V reduce(V that, V it),
    bool putIfAbsent = true,
  }) {
    final that = this; // ignore shadowed var

    other.forEach((k, v) {
      if (that.containsKey(k)) {
        if (reduce != null) {
          that[k] = reduce?.call(that[k], v);
        }
      } else {
        if (putIfAbsent) {
           that.putIfAbsent(k, () => v);
        }
      }
    });
    return that;
  }
}