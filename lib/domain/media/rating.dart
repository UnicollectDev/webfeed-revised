import 'package:xml/xml.dart';

/// The rating of a media element
/// See https://www.rssboard.org/media-rss#media-rating
class Rating {
  /// Default constructor for the Rating class
  Rating({
    this.scheme,
    this.value,
  });

  /// Parse constructor for the Rating class, used when 'parsing' a feed
  factory Rating.parse(XmlElement element) => Rating(
        scheme: element.getAttribute('scheme'),
        value: element.innerText,
      );

  /// The scheme of the rating
  final String? scheme;

  /// The value of the rating
  final String? value;
}
