import 'package:webfeed_revised/util/iterable.dart';
import 'package:xml/xml.dart';

/// The person element is used to specify the author of an entry or feed.
/// See https://tools.ietf.org/html/rfc4287#section-3.2
class AtomPerson {
  /// Default constructor for the AtomPerson class
  AtomPerson({this.name, this.uri, this.email});

  /// Parse constructor for the AtomPerson class, used when 'parsing' a feed
  factory AtomPerson.parse(XmlElement element) => AtomPerson(
        name: element.findElements('name').firstOrNull?.innerText,
        uri: element.findElements('uri').firstOrNull?.innerText,
        email: element.findElements('email').firstOrNull?.innerText,
      );

  /// The name of the person
  final String? name;

  /// The URI of the person, must be an IRI reference
  final String? uri;

  /// The email of the person
  final String? email;
}
