import 'package:xml/xml.dart';

/// The category of a feed
/// See https://www.rssboard.org/media-rss#media-category
class Category {
  /// Default constructor for the Category class
  Category({
    this.scheme,
    this.label,
    this.value,
  });

  /// Parse constructor for the Category class, used when 'parsing' a feed
  factory Category.parse(XmlElement element) => Category(
        scheme: element.getAttribute('scheme'),
        label: element.getAttribute('label'),
        value: element.innerText,
      );

  /// The scheme of the category
  final String? scheme;

  /// The label of the category
  final String? label;

  /// The value of the category
  final String? value;
}
