import 'package:xml/xml.dart';

/// The source of a Rss item
/// See https://www.rssboard.org/rss-specification#ltsourcegtSubelementOfLtitemgt
class RssSource {
  /// Default constructor for the RssSource class
  RssSource(this.url, this.value);

  /// Parse constructor for the RssSource class, used when 'parsing' a feed
  factory RssSource.parse(XmlElement element) {
    final url = element.getAttribute('url');
    final value = element.innerText;

    return RssSource(url, value);
  }

  /// The url of the source
  final String? url;

  /// The value of the source
  final String? value;
}
