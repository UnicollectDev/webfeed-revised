import 'package:xml/xml.dart';

/// Optional element for P2P link
/// See https://www.rssboard.org/media-rss#media-peerlink
class PeerLink {
  /// Default constructor for the Community class
  PeerLink({
    this.type,
    this.href,
    this.value,
  });

  /// Parse constructor for the PeerLink class, used when 'parsing' a feed
  factory PeerLink.parse(XmlElement element) => PeerLink(
        type: element.getAttribute('type'),
        href: element.getAttribute('href'),
        value: element.innerText,
      );

  /// The type of the P2P link
  final String? type;

  /// The actual P2P link
  final String? href;

  /// Unknown
  final String? value;
}
