import 'dart:math';

import 'package:meta/meta.dart';

const _alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
final _rnd = Random();

class AlphabetTree {
  final List<AlphabetTree> nodes;
  final String letter;

  /// Get all letters in the tree.
  late final Iterable<String> values;

  AlphabetTree._private(this.letter, {this.nodes = const []}) {
    final list = [letter];
    if (nodes.isNotEmpty) {
      final complete = nodes.map<Iterable<String>>((e) => e.values).reduce(
            (list1, list2) => <String>[...list1, ...list2],
          );
      list.addAll(complete);
    }
    values = list;
  }

  /// Creates an AlphabetTree of any [size] or [length].
  ///
  /// [size]: number of children of a given node. by default it will be set to 1
  /// so the you can call the constructor with only the length parameter.
  ///
  /// [length]: number of descendants. If not provided it will be set to 0 so no
  /// nodes will be created.
  factory AlphabetTree({int? length, int? size}) {
    assert(
      length != null || size != null,
      'You must provide at least one argument',
    );

    final _length = length ?? 0;
    final _size = size ?? 1;
    assert(_size >= 0, 'You must provide a valid size');

    final _nodes = <AlphabetTree>[];

    if (_length >= 0) {
      _nodes.addAll(List<AlphabetTree>.generate(
        _size,
        (_) => AlphabetTree(
          length: _length - 1,
          size: size,
        ),
      ));
    }

    return AlphabetTree._private(
      String.fromCharCode(
        _alphabet.codeUnitAt(_rnd.nextInt(_alphabet.length)),
      ),
      nodes: _nodes,
    );
  }

  /// Test constructor to test value assignation and comparisons.
  /// FOR UNIT TESTS ONLY
  @visibleForTesting
  static AlphabetTree test({
    required String initialLetter,
    List<AlphabetTree> nodes = const [],
  }) =>
      AlphabetTree._private(initialLetter, nodes: nodes);

  /// Compare the data of the two trees and prints all the unique letters within
  /// the two trees, in alphabetic order.
  ///
  /// Made a return type of List<String> to make it testable.
  List<String> compare(AlphabetTree other) {
    final result = <String>{};

    result.addAll(values.toSet());

    for (final e in other.values.toSet()) {
      if (result.contains(e)) {
        result.remove(e);
      } else {
        result.add(e);
      }
    }

    final sortedResults = result.toList()..sort();
    print(sortedResults);

    return sortedResults;
  }
}
