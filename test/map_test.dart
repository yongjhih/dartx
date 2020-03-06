import 'package:test/test.dart';
import 'package:dartx/dartx.dart';

void main() {
  group('MapX', () {
    test('.mergeWith()', () {
      final a = <String, int>{
        "a": null,
        "ab": null,
        "abc": null,
      };
      final b = <String, int>{
      "ab": 2,
      };
      final expected = <String, int>{
        "a": null,
        "ab": 2,
        "abc": null,
      };
      expect(a.mergeWith(b), expected);
    });
    test('.mergeWith(empty)', () {
      final a = <String, int>{
        "a": null,
        "ab": null,
        "abc": null,
      };
      final b = <String, int>{};
      final expected = <String, int>{
        "a": null,
        "ab": null,
        "abc": null,
      };
      expect(a.mergeWith(b), expected);
    });
    test('.mergeWith() from empty', () {
      final a = <String, int>{};
      final b = <String, int>{
        "a": null,
        "ab": null,
        "abc": null,
      };
      final expected = <String, int>{
        "a": null,
        "ab": null,
        "abc": null,
      };
      expect(a.mergeWith(b), expected);
    });
    test('.mergeWith(empty) from empty', () {
      final a = <String, int>{
      };
      final b = <String, int>{
      };
      final expected = <String, int>{
      };
      expect(a.mergeWith(b), expected);
    });
    test('.mergeWith(value: (that, it))', () {
      final a = <String, int>{
        "a": 1,
        "ab": 2,
        "abc": 3,
      };
      final b = <String, int>{
        "a": 1,
        "ab": 2,
        "abc": 3,
      };
      expect(
        a.mergeWith(b, value: (that, it) => that + it),
        <String, int>{
          "a": 2,
          "ab": 4,
          "abc": 6,
        }
      );

      expect(
        <String, int>{
          "a": 1,
          "ab": 2,
          "abc": 3,
        }.mergeWith(<String, int>{
          "ab": 2,
        }, value: (that, it) => that + it),
        <String, int>{
          "a": 1,
          "ab": 4,
          "abc": 3,
        }
      );

      expect(
        <String, int>{
          "a": 1,
          "ab": 2,
          "abc": 3,
        }.mergeWith(<String, int>{
          "abcd": 2,
        }, value: (that, it) => that + it),
        <String, int>{
          "a": 1,
          "ab": 2,
          "abc": 3,
          "abcd": 2,
        }
      );
    });
    test('.mergeWith(putIfAbsent: false)', () {
      expect(
        <String, int>{
          "a": 1,
          "ab": 2,
          "abc": 3,
        }.mergeWith(<String, int>{
          "abcd": 2,
        }, value: (that, it) => that + it, putIfAbsent: false),
        <String, int>{
          "a": 1,
          "ab": 2,
          "abc": 3,
        }
      );
    });
  });
}
