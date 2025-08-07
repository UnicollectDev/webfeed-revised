import 'package:xml/xml.dart';

/// Different types of Episodes in the Itunes RSS specification.
/// See https://help.apple.com/itc/podcasts_connect/#/itcb54353390
enum ItunesEpisodeType {
  /// The default type, used when submitting the complete content of a show.
  full,

  /// Used when submitting a short, promotional piece of content
  trailer,

  /// Used when submitting extra content for a show.
  bonus,

  /// A fallback type.
  unknown
}

/// Parses the [element] text to a ItunesEpisodeType
ItunesEpisodeType newItunesEpisodeType(XmlElement element) {
  switch (element.innerText) {
    case 'full':
      return ItunesEpisodeType.full;
    case 'trailer':
      return ItunesEpisodeType.trailer;
    case 'bonus':
      return ItunesEpisodeType.bonus;
    default:
      return ItunesEpisodeType.unknown;
  }
}
