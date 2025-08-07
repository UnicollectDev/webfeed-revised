import 'package:xml/xml.dart';

/// The license of a feed
/// See https://www.rssboard.org/media-rss#media-license
class License {
  /// Default constructor for the License class
  License({
    this.type,
    this.href,
    this.value,
  });

  /// Parse constructor for the License class, used when 'parsing' a feed
  factory License.parse(XmlElement element) => License(
        type: element.getAttribute('type'),
        href: element.getAttribute('href'),
        value: element.innerText,
      );

  /// The type of the license
  final String? type;

  /// The href of the license
  final String? href;

  /// The value of the license
  final String? value;
}
