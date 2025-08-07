import 'package:xml/xml.dart';

/// The parameters of a embed element
/// See https://www.rssboard.org/media-rss#media-embed
class Param {
  /// Default constructor for the Param class
  Param({
    this.name,
    this.value,
  });

  /// Parse constructor for the Param class, used when 'parsing' a feed
  factory Param.parse(XmlElement element) => Param(
        name: element.getAttribute('name'),
        value: element.innerText,
      );

  /// The name of the parameter
  final String? name;

  /// The value of the parameter
  final String? value;
}
