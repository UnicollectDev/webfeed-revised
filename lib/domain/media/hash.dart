import 'package:xml/xml.dart';

/// The hash of a feed
/// See https://www.rssboard.org/media-rss#media-hash
class Hash {
  /// Default constructor for the Hash class
  Hash({
    this.algo,
    this.value,
  });

  /// Parse constructor for the Hash class, used when 'parsing' a feed
  factory Hash.parse(XmlElement element) => Hash(
        algo: element.getAttribute('algo'),
        value: element.innerText,
      );

  /// The algorithm of the hash
  final String? algo;

  /// The value of the hash
  final String? value;
}
