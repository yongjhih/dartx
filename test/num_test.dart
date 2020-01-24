import 'package:test/test.dart';
import 'package:dartx/dartx.dart';

void main() {
  group('NumX', () {
    test('.coerceIn()', () {
      expect(10.coerceIn(0), 10);
      expect(10.coerceIn(12), 12);
      expect(10.coerceIn(0, 11), 10);
      expect(10.coerceIn(0, 9), 9);
      expect(() => 10.coerceIn(3, 2), throwsArgumentError);
    });

    test('.coerceAtLeast()', () {
      expect(10.coerceAtLeast(0), 10);
      expect(10.coerceAtLeast(12), 12);
    });

    test('.coerceAtMost()', () {
      expect(10.coerceAtMost(12), 10);
      expect(10.coerceAtMost(5), 5);
    });

    test('.roundDouble()', () {
      expect(12.3412.roundDouble(2), 12.34);
      expect(12.5668.roundDouble(2), 12.57);
      expect(-12.3412.roundDouble(2), -12.34);
      expect(-12.3456.roundDouble(2), -12.35);

      expect(12.3412.roundDouble(0), 12.3412.roundToDouble());
    });
  });
}
