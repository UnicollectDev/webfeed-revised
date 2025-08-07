import 'package:webfeed_revised/util/iterable.dart';
import 'package:xml/xml.dart';

/// The image of a RSS feed
/// See https://www.rssboard.org/rss-specification#ltimagegtSubelementOfLtchannelgt
class RssImage {
  /// Default constructor for the RssImage class
  RssImage({this.title, this.url, this.link});

  /// Parse constructor for the RssImage class, used when 'parsing' a feed
  factory RssImage.parse(XmlElement element) => RssImage(
        title: element.findElements('title').firstOrNull?.innerText,
        url: element.findElements('url').firstOrNull?.innerText,
        link: element.findElements('link').firstOrNull?.innerText,
      );

  /// The title of the image
  final String? title;

  /// The url of the image
  final String? url;

  /// The link of the image
  final String? link;
}
