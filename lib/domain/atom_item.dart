import 'package:webfeed_revised/domain/atom_category.dart';
import 'package:webfeed_revised/domain/atom_link.dart';
import 'package:webfeed_revised/domain/atom_person.dart';
import 'package:webfeed_revised/domain/atom_source.dart';
import 'package:webfeed_revised/domain/media/media.dart';
import 'package:webfeed_revised/util/datetime.dart';
import 'package:webfeed_revised/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents an Atom item
/// See https://tools.ietf.org/html/rfc4287
class AtomItem {
  /// Default constructor for the AtomItem class
  AtomItem({
    this.id,
    this.title,
    this.updated,
    this.authors,
    this.links,
    this.categories,
    this.contributors,
    this.source,
    this.published,
    this.content,
    this.summary,
    this.rights,
    this.media,
  });

  /// Parse constructor for the AtomItem class, used when 'parsing' a feed
  factory AtomItem.parse(XmlElement element) => AtomItem(
        id: element.findElements('id').firstOrNull?.innerText,
        title: element.findElements('title').firstOrNull?.innerText,
        updated: parseDateTime(
          element.findElements('updated').firstOrNull?.innerText,
        ),
        authors: element.findElements('author').map(AtomPerson.parse).toList(),
        links: element.findElements('link').map(AtomLink.parse).toList(),
        categories:
            element.findElements('category').map(AtomCategory.parse).toList(),
        contributors:
            element.findElements('contributor').map(AtomPerson.parse).toList(),
        source:
            element.findElements('source').map(AtomSource.parse).firstOrNull,
        published: element.findElements('published').firstOrNull?.innerText,
        content: element.findElements('content').firstOrNull?.innerText,
        summary: element.findElements('summary').firstOrNull?.innerText,
        rights: element.findElements('rights').firstOrNull?.innerText,
        media: Media.parse(element),
      );

  /// The item id
  final String? id;

  /// The item title
  final String? title;

  /// The item updated date
  final DateTime? updated;

  /// The item authors
  final List<AtomPerson>? authors;

  /// The item links
  final List<AtomLink>? links;

  /// The item categories
  final List<AtomCategory>? categories;

  /// The item contributors
  final List<AtomPerson>? contributors;

  /// The item source
  final AtomSource? source;

  /// The item published date
  final String? published;

  /// The item content
  final String? content;

  /// The item summary
  final String? summary;

  /// The item rights
  final String? rights;

  /// The item media
  final Media? media;
}
