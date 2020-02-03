part of dartx;

extension MapX<K, V> on Map<K, V> {
  /// Return addAll([other])
  @override
  Map<K, V> operator +(Map<K, V> other) =>
    this..addAll(other);

  /// Creates a new map from [map] with new keys and values.
  ///
  /// The return values of [key] are used as the keys and the return values of
  /// [value] are used as the values for the new map.
  Map<K2, V2> map<K2, V2>({
    K2 key(K key, V value),
    V2 value(K key, V value),
  }) => mapMap<K, V, K2, V2>(this, key: key, value: value);

  /// Returns a new map with all key/value pairs in both [this] and [other].
  ///
  /// If there are keys that occur in both maps, the [value] function is used to
  /// select the value that goes into the resulting map based on the two original
  /// values. If [value] is omitted, the value from [other] is used.
  Map<K, V> merge(Map<K, V> other, {
    V value(V that, V it),
  }) => mergeMaps(this, other, value: value);

  /// Returns a new map with new values from [other]
  ///
  /// If there are keys that occur in both maps, the [value] function is used to
  /// select the value that goes into the resulting map based on the two original
  /// values. If [value] is omitted, the value from [other] is used.
  Map<K, V> mergeWith(Map<K, V> other, {
    V value(V that, V it),
    bool putIfAbsent = true,
  }) {
    final that = Map<K, V>.from(this);
    other.forEach((k, v) {
      if (that.containsKey(k)) {
        if (value != null) {
          that[k] = value(that[k], v);
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