import 'package:webfeed_revised/domain/atom_category.dart';
import 'package:webfeed_revised/domain/atom_generator.dart';
import 'package:webfeed_revised/domain/atom_item.dart';
import 'package:webfeed_revised/domain/atom_link.dart';
import 'package:webfeed_revised/domain/atom_person.dart';
import 'package:webfeed_revised/util/datetime.dart';
import 'package:webfeed_revised/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents an Atom feed
/// See https://tools.ietf.org/html/rfc4287
class AtomFeed {
  /// Default constructor for the AtomFeed class
  AtomFeed({
    this.id,
    this.title,
    this.updated,
    this.items,
    this.links,
    this.authors,
    this.contributors,
    this.categories,
    this.generator,
    this.icon,
    this.logo,
    this.rights,
    this.subtitle,
  });

  /// Parse constructor for the AtomFeed class, used when 'parsing' a feed
  factory AtomFeed.parse(String xmlString) {
    final document = XmlDocument.parse(xmlString);
    final feedElement = document.findElements('feed').firstOrNull;
    if (feedElement == null) {
      throw ArgumentError('feed not found');
    }

    return AtomFeed(
      id: feedElement.findElements('id').firstOrNull?.innerText,
      title: feedElement.findElements('title').firstOrNull?.innerText,
      updated: parseDateTime(
        feedElement.findElements('updated').firstOrNull?.innerText,
      ),
      items: feedElement.findElements('entry').map(AtomItem.parse).toList(),
      links: feedElement.findElements('link').map(AtomLink.parse).toList(),
      authors:
          feedElement.findElements('author').map(AtomPerson.parse).toList(),
      contributors: feedElement
          .findElements('contributor')
          .map(AtomPerson.parse)
          .toList(),
      categories:
          feedElement.findElements('category').map(AtomCategory.parse).toList(),
      generator: feedElement
          .findElements('generator')
          .map(AtomGenerator.parse)
          .firstOrNull,
      icon: feedElement.findElements('icon').firstOrNull?.innerText,
      logo: feedElement.findElements('logo').firstOrNull?.innerText,
      rights: feedElement.findElements('rights').firstOrNull?.innerText,
      subtitle: feedElement.findElements('subtitle').firstOrNull?.innerText,
    );
  }

  /// The feed id
  final String? id;

  /// The feed title
  final String? title;

  /// The feed updated date
  final DateTime? updated;

  /// The feed items
  final List<AtomItem>? items;

  /// The feed links
  final List<AtomLink>? links;

  /// The feed authors
  final List<AtomPerson>? authors;

  /// The feed contributors
  final List<AtomPerson>? contributors;

  /// The feed categories
  final List<AtomCategory>? categories;

  /// The feed generator
  final AtomGenerator? generator;

  /// The feed icon
  final String? icon;

  /// The feed logo
  final String? logo;

  /// The feed rights
  final String? rights;

  /// The feed subtitle
  final String? subtitle;
}
