import 'package:alphabet_trees/models/alphabet_tree.dart';
import 'package:test/test.dart';

void main() {
  group('AlphabetTree Creation', () {
    test('no args', () {
      expect(() => AlphabetTree(), throwsA(isA<AssertionError>()));
    });

    group('with size of:', () {
      test('5', () {
        final tree = AlphabetTree(size: 5);
        expect(tree.nodes.length, 5);
      });

      test('-1', () {
        expect(() => AlphabetTree(size: -1), throwsA(isA<AssertionError>()));
      });
    });

    group('with length of:', () {
      test('3', () {
        final tree = AlphabetTree(length: 3);
        expect(tree.nodes.length, 1);

        final firstNode = tree.nodes[0];
        expect(firstNode.nodes.length, 1);

        final secondNode = firstNode.nodes[0];
        expect(secondNode.nodes.length, 1);

        final thirdNode = secondNode.nodes[0];
        expect(thirdNode.nodes.length, 1);

        final fourthNode = thirdNode.nodes[0];
        expect(fourthNode.nodes.isEmpty, true);
      });
    });

    group('with size and length of:', () {
      test('size: 2 - length: 2', () {
        final tree = AlphabetTree(
          size: 2,
          length: 2,
        );
        expect(tree.nodes.length, 2);

        final firstNode = tree.nodes[0];
        expect(firstNode.nodes.length, 2);

        final secondNode = firstNode.nodes[0];
        expect(secondNode.nodes.length, 2);

        final thirdNode = secondNode.nodes[0];
        expect(thirdNode.nodes.isEmpty, true);
      });

      test('size: 2 - length: 3', () {
        final tree = AlphabetTree(
          size: 2,
          length: 3,
        );
        expect(tree.nodes.length, 2);

        final firstNode = tree.nodes[0];
        expect(firstNode.nodes.length, 2);

        final secondNode = firstNode.nodes[0];
        expect(secondNode.nodes.length, 2);

        final thirdNode = secondNode.nodes[0];
        expect(thirdNode.nodes.length, 2);

        final fourthNode = thirdNode.nodes[0];
        expect(fourthNode.nodes.isEmpty, true);
      });
    });
  });

  group('AlphabetTree Properties', () {
    group('letter', () {
      test('1', () {
        final tree = AlphabetTree.test(initialLetter: 'A');
        expect(tree.letter, 'A');
      });

      test('2', () {
        final tree = AlphabetTree.test(initialLetter: 'B');
        expect(tree.letter, 'B');
      });
    });

    group('values', () {
      test('1', () {
        final tree = AlphabetTree.test(initialLetter: 'A');
        expect(tree.values, ['A']);
      });

      test('2', () {
        final tree = AlphabetTree.test(
          initialLetter: 'A',
          nodes: [AlphabetTree.test(initialLetter: 'A')],
        );
        expect(tree.values, ['A', 'A']);
      });
    });
  });

  group('AlphabetTree Methods', () {
    group('compare', () {
      test('3 common letters', () {
        final tree1 = AlphabetTree.test(
          initialLetter: 'A',
          nodes: [
            AlphabetTree.test(initialLetter: 'B'),
            AlphabetTree.test(initialLetter: 'C'),
            AlphabetTree.test(initialLetter: 'D'),
          ],
        );
        final tree2 = AlphabetTree.test(initialLetter: 'A');
        expect(tree1.compare(tree2), ['B', 'C', 'D']);
      });

      test('1 common letters', () {
        final tree1 = AlphabetTree.test(
          initialLetter: 'A',
          nodes: [
            AlphabetTree.test(initialLetter: 'B'),
            AlphabetTree.test(initialLetter: 'C'),
            AlphabetTree.test(initialLetter: 'D'),
          ],
        );
        final tree2 = AlphabetTree.test(
          initialLetter: 'A',
          nodes: [
            AlphabetTree.test(initialLetter: 'B'),
            AlphabetTree.test(initialLetter: 'D'),
          ],
        );
        expect(tree1.compare(tree2), ['C']);
      });

      test('sort letters in alphabetical order', () {
        final tree1 = AlphabetTree.test(
          initialLetter: 'I',
          nodes: [
            AlphabetTree.test(initialLetter: 'K'),
            AlphabetTree.test(initialLetter: 'V'),
            AlphabetTree.test(initialLetter: 'T'),
          ],
        );
        final tree2 = AlphabetTree.test(
          initialLetter: 'E',
          nodes: [
            AlphabetTree.test(initialLetter: 'D'),
            AlphabetTree.test(initialLetter: 'L'),
          ],
        );
        expect(tree1.compare(tree2), ['D', 'E', 'I', 'K', 'L', 'T', 'V']);
      });
    });
  });
}
