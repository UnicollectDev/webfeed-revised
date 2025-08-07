import 'package:webfeed_revised/util/datetime.dart';
import 'package:webfeed_revised/util/iterable.dart';
import 'package:xml/xml.dart';

/// The Dublin Core Metadata Element Set
/// See https://www.dublincore.org/specifications/dublin-core/dcmi-terms/
class DublinCore {
  /// Default constructor for the DublinCore class
  DublinCore({
    this.title,
    this.description,
    this.creator,
    this.subject,
    this.publisher,
    this.contributor,
    this.date,
    this.created,
    this.modified,
    this.type,
    this.format,
    this.identifier,
    this.source,
    this.language,
    this.relation,
    this.coverage,
    this.rights,
  });

  /// Parse constructor for the DublinCore class, used when 'parsing' a feed
  factory DublinCore.parse(XmlElement element) => DublinCore(
        title: element.findElements('dc:title').firstOrNull?.innerText,
        description:
            element.findElements('dc:description').firstOrNull?.innerText,
        creator: element.findElements('dc:creator').firstOrNull?.innerText,
        subject: element.findElements('dc:subject').firstOrNull?.innerText,
        publisher: element.findElements('dc:publisher').firstOrNull?.innerText,
        contributor:
            element.findElements('dc:contributor').firstOrNull?.innerText,
        date: parseDateTime(
          element.findElements('dc:date').firstOrNull?.innerText,
        ),
        created: parseDateTime(
          element.findElements('dc:created').firstOrNull?.innerText,
        ),
        modified: parseDateTime(
          element.findElements('dc:modified').firstOrNull?.innerText,
        ),
        type: element.findElements('dc:type').firstOrNull?.innerText,
        format: element.findElements('dc:format').firstOrNull?.innerText,
        identifier:
            element.findElements('dc:identifier').firstOrNull?.innerText,
        source: element.findElements('dc:source').firstOrNull?.innerText,
        language: element.findElements('dc:language').firstOrNull?.innerText,
        relation: element.findElements('dc:relation').firstOrNull?.innerText,
        coverage: element.findElements('dc:coverage').firstOrNull?.innerText,
        rights: element.findElements('dc:rights').firstOrNull?.innerText,
      );

  /// The title of the resource
  final String? title;

  /// A description of the resource
  final String? description;

  /// An entity primarily responsible for making the resource
  final String? creator;

  /// The topic of the resource
  final String? subject;

  /// An entity responsible for making the resource available
  final String? publisher;

  /// An entity responsible for making contributions to the resource
  final String? contributor;

  /// A point or period of time associated with an event in the lifecycle of the
  /// resource
  final DateTime? date;

  /// The date of creation of the resource
  final DateTime? created;

  /// The date of modification of the resource
  final DateTime? modified;

  /// The nature or genre of the resource
  final String? type;

  /// The file format, physical medium, or dimensions of the resource
  final String? format;

  /// An unambiguous reference to the resource within a given context
  final String? identifier;

  /// A related resource from which the described resource is derived
  final String? source;

  /// A language of the resource
  final String? language;

  /// A related resource
  final String? relation;

  /// The spatial or temporal topic of the resource, the spatial applicability
  /// of the resource, or the jurisdiction under which the resource is relevant
  final String? coverage;

  /// Information about rights held in and over the resource
  final String? rights;
}
