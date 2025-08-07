import 'package:xml/xml.dart';

/// The copyright of a feed
/// See https://www.rssboard.org/media-rss#media-copyright
class Copyright {
  /// Default constructor for the Copyright class
  Copyright({
    this.url,
    this.value,
  });

  /// Parse constructor for the Copyright class, used when 'parsing' a feed
  factory Copyright.parse(XmlElement element) => Copyright(
        url: element.getAttribute('url'),
        value: element.innerText,
      );

  /// The url of the copyright
  final String? url;

  /// The value of the copyright
  final String? value;
}
