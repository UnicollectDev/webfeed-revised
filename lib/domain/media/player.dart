import 'package:xml/xml.dart';

/// The player of a media feed
/// See https://www.rssboard.org/media-rss#media-player
class Player {
  /// Default constructor for the Player class
  Player({
    this.url,
    this.width,
    this.height,
    this.value,
  });

  /// Parse constructor for the Player class, used when 'parsing' a feed
  factory Player.parse(XmlElement element) => Player(
        url: element.getAttribute('url'),
        width: int.tryParse(element.getAttribute('width') ?? '0'),
        height: int.tryParse(element.getAttribute('height') ?? '0'),
        value: element.innerText,
      );

  /// The url of the player
  final String? url;

  /// The width of the player
  final int? width;

  /// The height of the player
  final int? height;

  /// The value of the player
  final String? value;
}
