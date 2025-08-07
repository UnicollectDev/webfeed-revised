import 'package:webfeed_revised/util/iterable.dart';
import 'package:xml/xml.dart';

/// The podcast owner contact information
/// See https://help.apple.com/itc/podcasts_connect/#/itcb54353390
class ItunesOwner {
  /// Default constructor for the ItunesOwner class
  ItunesOwner({this.name, this.email});

  /// Parse constructor for the ItunesOwner class, used when 'parsing' a feed
  factory ItunesOwner.parse(XmlElement element) => ItunesOwner(
        name: element.findElements('itunes:name').firstOrNull?.innerText.trim(),
        email:
            element.findElements('itunes:email').firstOrNull?.innerText.trim(),
      );

  /// The name of the podcast owner
  final String? name;

  /// The email of the podcast owner
  final String? email;
}
