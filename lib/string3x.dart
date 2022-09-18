/// An extention on String with various useful functionality
/// 
/// Convertors such as [toCamelCase] (`camelCase`), [toPascalCase] (`PascalCase`) and [toSnakeCase] (`snake_case`).
/// Trimmers such as [rtrim] & [ltrim] for right and left trim, respectively.  
/// [removeExtraSpace] to remove any extra white spaces (>1) such as:
/// ```
/// "  a    b   c   d   " => " a b c d "
/// ```
/// 
extension StringUtils on String {
  String toUpperFirst() => '${this[0].toUpperCase()}${substring(1)}';
  String toLowerFirst() => '${this[0].toLowerCase()}${substring(1)}';

  /// this will remove extra spaces (i.e., > 1 space in sequence);
  String removeExtraSpace() => replaceAll(RegExp(r'\s{2,}'), ' ');

  /// trims leading whitespace
  String ltrim() {
    return replaceFirst(RegExp(r'^\s+'), '');
  }

  /// trims trailing whitespace
  String rtrim() {
    return replaceFirst(RegExp(r'\s+$'), '');
  }

  /// returns `true` if `this` is of `snake_case` pattern
  bool get isSnakeCase {
    return contains('_');
  }

  /// returns `true` if `this` is of `PascalCase`pattern
  bool get isPascalCase {
    return startsWith(RegExp('[A-Z]')) && !isSnakeCase;
  }

  /// returns `true` if `this` is of `camelCase` pattern
  bool get isCamelCase {
    return !isPascalCase && !isSnakeCase;
  }

  String toSnakeCase() {
    if (isCamelCase) {
      return _toSnakeCaseFromCamelCase();
    } else if (isPascalCase) {
      return _toSnakeCaseFromPascalCase();
    } else {
      return this;
    }
  }

  String toCamelCase() {
    if (isSnakeCase) {
      return _toCamelCaseFromSnakeCase();
    } else if (isPascalCase) {
      return _toCamelCaseFromPascalCase();
    } else {
      return this;
    }
  }

  String toPascalCase() {
    if (isSnakeCase) {
      return _toPascalCaseFromSnakeCase();
    } else if (isCamelCase) {
      return toUpperFirst();
    } else {
      return this;
    }
  }

  /// Converts snake_case to camelCase
  String _toCamelCaseFromSnakeCase() {
    if (!contains('_')) return this;

    return split('_').reduce((value, element) => value + element.toUpperFirst());
  }

  /// Converts snake_case to PascalCase
  String _toPascalCaseFromSnakeCase() {
    if (!contains('_')) return toUpperFirst();

    return _toCamelCaseFromSnakeCase().toUpperFirst();
  }

  // credit: https://stackoverflow.com/a/19533226/10976714
  static final _pascalToSnakeMatcher = RegExp('[A-Z]([A-Z](?![a-z]))*');

  // convert PascalCase to snake_case
  String _toSnakeCaseFromPascalCase() {
    return replaceAllMapped(_pascalToSnakeMatcher, (Match m) => '_${m.group(0)}').replaceFirst('_', '').toLowerCase();
  }

  // convert camelCase to snake_case
  String _toSnakeCaseFromCamelCase() {
    return toUpperFirst()._toSnakeCaseFromPascalCase();
  }

  static final _pascalToCamelMatcher = RegExp('^[A-Z]{1,}(?=[a-z])');
  String _toCamelCaseFromPascalCase() {
    final match = _pascalToCamelMatcher.firstMatch(this);
    if (match != null && match.group(0) != null) {
      final letters = match.group(0)!;
      if (letters.length > 1) {
        return replaceRange(0, letters.length - 1, letters.substring(0, letters.length - 1).toLowerCase());
      } else {
        return toLowerFirst();
      }
    } else {
      return this;
    }
  }
}
