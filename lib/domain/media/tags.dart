import 'package:xml/xml.dart';

/// The tags of a media element
/// See https://www.rssboard.org/media-rss#media-tags
class Tags {
  /// Default constructor for the Tags class
  Tags({
    this.tags,
    this.weight,
  });

  /// Parse constructor for the Tags class, used when 'parsing' a feed
  factory Tags.parse(XmlElement element) => Tags(
        tags: element.innerText,
        weight: int.tryParse(element.getAttribute('weight') ?? '1'),
      );

  /// The tags of the media
  final String? tags;

  /// The weight of the tags
  final int? weight;
}
