import 'package:xml/xml.dart';

/// The credit of a feed
/// See https://www.rssboard.org/media-rss#media-credit
class Credit {
  /// Default constructor for the Credit class
  Credit({
    this.role,
    this.scheme,
    this.value,
  });

  /// Parse constructor for the Credit class, used when 'parsing' a feed
  factory Credit.parse(XmlElement element) => Credit(
        role: element.getAttribute('role'),
        scheme: element.getAttribute('scheme'),
        value: element.innerText,
      );

  /// The role of the credit
  final String? role;

  /// The scheme of the credit
  final String? scheme;

  /// The value of the credit
  final String? value;
}
