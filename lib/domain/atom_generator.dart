import 'package:xml/xml.dart';

/// Used to identify the agent used to generate a feed
/// See https://tools.ietf.org/html/rfc4287#section-4.2.4
class AtomGenerator {
  /// Default constructor for the AtomGenerator class
  AtomGenerator(this.uri, this.version, this.value);

  /// Parse constructor for the AtomGenerator class, used when 'parsing' a feed
  factory AtomGenerator.parse(XmlElement element) {
    final uri = element.getAttribute('uri');
    final version = element.getAttribute('version');
    final value = element.innerText;
    return AtomGenerator(uri, version, value);
  }

  /// The URI of the software used to generate the feed, must be an IRI
  /// reference
  final String? uri;

  /// The version of the generating agent
  final String? version;

  /// The name of the generating agent
  final String? value;
}
