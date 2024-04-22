import 'package:intl/intl.dart';

/// [DateTime] format based on the RFC 822 specification
const rfc822DatePattern = 'EEE, dd MMM yyyy HH:mm:ss Z';

/// [DateTime] format based on the RFC 822 specification without seconds
const rfc822DateWithoutSecondsPattern = 'EEE, dd MMM yyyy HH:mm Z';

/// [DateTime] format based on the RFC 822 specification without time
const rfc822DateOnlyPattern = 'EEE, dd MMM yyyy';

/// Parses a [String] to a [DateTime] object
DateTime? parseDateTime(String? dateString) {
  if (dateString == null) return null;
  return _parseRfc822DateTime(dateString) ?? _parseIso8601DateTime(dateString);
}

/// Parses a [String] to a [DateTime] object based on the RFC 822 specification
DateTime? _parseRfc822DateTime(String dateString) {
  try {
    var utc = false;
    if (dateString.contains(RegExp('(GMT|[+-]0{2}(0{2})?)'))) {
      utc = true;
    }

    var pattern = rfc822DateOnlyPattern;
    if (dateString.contains(RegExp('(0?[1-9]|1[0-2]):[0-5][0-9]:[0-5][0-9]'))) {
      pattern = rfc822DatePattern;
    } else if (dateString.contains(RegExp('(0?[1-9]|1[0-2]):[0-5][0-9]'))) {
      pattern = rfc822DateWithoutSecondsPattern;
    }

    //force locale to en_US because EEE always en_US and cannot be parsed in other locales
    final format = DateFormat(pattern,'en_US');
    return format.parse(dateString, utc);
  } on FormatException {
    return null;
  }
}

/// Parses a [String] to a [DateTime] object based on the ISO 8601 specification
DateTime? _parseIso8601DateTime(String dateString) {
  try {
    return DateTime.parse(dateString);
  } on FormatException {
    return null;
  }
}
