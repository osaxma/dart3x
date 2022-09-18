import 'package:dart3x/string3x.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('test String extension', () {
    test(' - from PascalCase to snake_case', () {
      final string = 'PascalCase'.toSnakeCase();
      final expected = 'pascal_case';
      expect(string, expected);
    });

    test(' - from IDPascalCase to id_snake_case', () {
      final string = 'IDPascalCase'.toSnakeCase();
      final expected = 'id_pascal_case';
      expect(string, expected);
    });

    test(' - from IDPascalCase to idPascalCase', () {
      final string = 'IDPascalCase'.toCamelCase();
      final expected = 'idPascalCase';
      expect(string, expected);
    });

    test(' - from IdPASCALCase to idPascalCase', () {
      final string = 'IdPASCALCase'.toCamelCase();
      final expected = 'idPASCALCase';
      expect(string, expected);
    });

    test(' - from snake_case to PascalCase', () {
      final string = 'snake_case'.toPascalCase();
      final expected = 'SnakeCase';
      expect(string, expected);
    });

    test(' - from snake_case to camelCase', () {
      final string = 'snake_case'.toCamelCase();
      final expected = 'snakeCase';
      expect(string, expected);
    });

    test(' - from camelCase to snake_case', () {
      final string = 'camelCase'.toSnakeCase();
      final expected = 'camel_case';
      expect(string, expected);
    });

    test(' - from camelCaseID to snake_case_id', () {
      final string = 'camelCaseID'.toSnakeCase();
      final expected = 'camel_case_id';
      expect(string, expected);
    });

    test(' - from CapitalFirst to lowerFirst', () {
      final string = 'CapitalFirst'.toLowerFirst();
      final expected = 'capitalFirst';
      expect(string, expected);
    });

    test(' - from lowerFirst to CapitalFirst', () {
      final string = 'lowerFirst'.toUpperFirst();
      final expected = 'LowerFirst';
      expect(string, expected);
    });

    test(' - trim all leading whitespace', () {
      final string = '     string'.ltrim();
      final expected = 'string';
      expect(string, expected);
    });

    test(' - trim all trailing whitespace', () {
      final string = 'string     '.rtrim();
      final expected = 'string';
      expect(string, expected);
    });

    test(' - remove extra whitespace (more than two consecutive spaces)', () {
      final string = 'a  b    c   d     e    f'.removeExtraSpace();
      final expected = 'a b c d e f';
      expect(string, expected);
    });

    test(' - from snake3_case to PascalCase name with numbers', () {
      final string = 'dart3'.toPascalCase();
      final expected = 'Dart3';
      expect(string, expected);
    });
  });
}
