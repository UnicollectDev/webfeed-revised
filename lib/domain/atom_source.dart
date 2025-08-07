import 'package:webfeed_revised/util/iterable.dart';
import 'package:xml/xml.dart';

/// The source element is an optional sub-element of an Atom Item entry which
/// contains the source feed metadata.
/// See https://tools.ietf.org/html/rfc4287#section-4.2.11
class AtomSource {
  /// Default constructor for the AtomSource class
  AtomSource({
    this.id,
    this.title,
    this.updated,
  });

  /// Parse constructor for the AtomSource class, used when 'parsing' a feed
  factory AtomSource.parse(XmlElement element) => AtomSource(
        id: element.findElements('id').firstOrNull?.innerText,
        title: element.findElements('title').firstOrNull?.innerText,
        updated: element.findElements('updated').firstOrNull?.innerText,
      );

  /// The id of the source feed
  final String? id;

  /// The title of the source feed
  final String? title;

  /// The last updated date of the source feed
  final String? updated;
}
