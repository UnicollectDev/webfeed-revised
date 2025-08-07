import 'package:xml/xml.dart';

/// The description of a feed
/// See https://www.rssboard.org/media-rss#media-description
class Description {
  /// Default constructor for the Description class
  Description({
    this.type,
    this.value,
  });

  /// Parse constructor for the Description class, used when 'parsing' a feed
  factory Description.parse(XmlElement element) => Description(
        type: element.getAttribute('type'),
        value: element.innerText,
      );

  /// The type of the description
  final String? type;

  /// The value of the description
  final String? value;
}
