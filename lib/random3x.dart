import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
final _randomGenerator = Random();
String generateRandomID([
  int length = 20,
]) {
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => _chars.codeUnitAt(
        _randomGenerator.nextInt(_chars.length),
      ),
    ),
  );
}
