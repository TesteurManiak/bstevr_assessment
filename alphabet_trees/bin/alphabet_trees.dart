import 'dart:math';

import 'package:alphabet_trees/alphabet_trees.dart' as alphabet_trees;

void main(List<String> arguments) {
  final rand = Random();
  final tree = alphabet_trees.AlphabetTree(length: rand.nextInt(10));
  print('=== TREE VALUES ===\n${tree.values}');

  final otherTree = alphabet_trees.AlphabetTree(
    size: rand.nextInt(5),
    length: rand.nextInt(10),
  );
  print('=== OTHERTREE VALUES ===\n${otherTree.values}');

  print('=== COMPARE ===');
  tree.compare(otherTree);
}
