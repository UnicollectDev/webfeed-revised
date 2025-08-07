import 'package:xml/xml.dart';

final _imagesRegExp = RegExp(
  "<img\\s.*?src=(?:'|\")([^'\">]+)(?:'|\")",
  multiLine: true,
  caseSensitive: false,
);

/// The content of a rss item
/// See https://www.rssboard.org/rss-specification#hrelementsOfLtitemgt
class RssContent {
  /// Default constructor for the RssContent class
  RssContent(this.value, this.images);

  /// Parse constructor for the RssContent class, used when 'parsing' a feed
  factory RssContent.parse(XmlElement element) {
    final content = element.innerText;
    final images = <String>[];
    _imagesRegExp.allMatches(content).forEach((match) {
      images.add(match.group(1)!);
    });
    return RssContent(content, images);
  }

  /// The value of the content
  final String value;

  /// The images of the content
  final Iterable<String> images;
}
