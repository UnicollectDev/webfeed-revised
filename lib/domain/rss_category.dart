import 'package:xml/xml.dart';

/// The category of a Rss element
/// See https://www.rssboard.org/rss-specification#ltcategorygtSubelementOfLtitemgt
class RssCategory {
  /// Default constructor for the RssCategory class
  RssCategory(this.domain, this.value);

  /// Parse constructor for the RssCategory class, used when 'parsing' a feed
  factory RssCategory.parse(XmlElement element) =>
      RssCategory(element.getAttribute('domain'), element.innerText);

  /// The domain of the category
  final String? domain;

  /// The value of the category
  final String value;
}
