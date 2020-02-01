part of dartx;

extension MapX<K, V> on Map<K, V> {
  /// Return merged with other Map
  Map<K, V> mergeWith(Map<K, V> other, {V reduce(V that, V it),
    bool putIfAbsent = true,
  }) {
    final that = this; // ignore shadowed var

    other.forEach((k, v) {
      if (that.containsKey(k)) {
        if (reduce != null) {
          that[k] = reduce(that[k], v);
        } else {
          if (that[k] == null) {
            that[k] = v;
          }
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