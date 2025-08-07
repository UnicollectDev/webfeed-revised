import 'package:xml/xml.dart';

/// Different types of Feeds in the Itunes RSS specification
/// See https://help.apple.com/itc/podcasts_connect/#/itcb54353390
enum ItunesType {
  /// The default type, used when specifying the episodes can be consumed
  /// without any specific order
  episodic,

  /// Used when specifying episodes are intended to be consumed in sequential
  /// order
  serial,

  /// A fallback type
  unknown
}

/// Parses the [element] text to a ItunesType
ItunesType newItunesType(XmlElement element) {
  switch (element.innerText) {
    case 'episodic':
      return ItunesType.episodic;
    case 'serial':
      return ItunesType.serial;
    default:
      return ItunesType.unknown;
  }
}
