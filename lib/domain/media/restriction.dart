import 'package:xml/xml.dart';

/// The restriction of a media element
/// See https://www.rssboard.org/media-rss#media-restriction
class Restriction {
  /// Default constructor for the Restriction class
  Restriction({
    this.relationship,
    this.type,
    this.value,
  });

  /// Parse constructor for the Restriction class, used when 'parsing' a feed
  factory Restriction.parse(XmlElement element) => Restriction(
        relationship: element.getAttribute('relationship'),
        type: element.getAttribute('type'),
        value: element.innerText,
      );

  /// The relationship of the restriction
  final String? relationship;

  /// The type of the restriction
  final String? type;

  /// The value of the restriction
  final String? value;
}
