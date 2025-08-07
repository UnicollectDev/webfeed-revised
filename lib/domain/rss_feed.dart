import 'dart:core';

import 'package:webfeed_revised/domain/dublin_core/dublin_core.dart';
import 'package:webfeed_revised/domain/itunes/itunes.dart';
import 'package:webfeed_revised/domain/rss_category.dart';
import 'package:webfeed_revised/domain/rss_cloud.dart';
import 'package:webfeed_revised/domain/rss_image.dart';
import 'package:webfeed_revised/domain/rss_item.dart';
import 'package:webfeed_revised/domain/syndication/syndication.dart';
import 'package:webfeed_revised/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents an RSS feed
/// See https://www.rssboard.org/rss-specification
class RssFeed {
  /// Default constructor for the RssFeed class
  RssFeed({
    this.title,
    this.author,
    this.description,
    this.link,
    this.items,
    this.image,
    this.cloud,
    this.categories,
    this.skipDays,
    this.skipHours,
    this.lastBuildDate,
    this.language,
    this.generator,
    this.copyright,
    this.docs,
    this.managingEditor,
    this.rating,
    this.webMaster,
    this.ttl,
    this.dc,
    this.itunes,
    this.syndication,
  });

  /// Parse constructor for the RssFeed class, used when 'parsing' a feed
  factory RssFeed.parse(String xmlString) {
    final document = XmlDocument.parse(xmlString);
    final rss = document.findElements('rss').firstOrNull;
    final rdf = document.findElements('rdf:RDF').firstOrNull;
    if (rss == null && rdf == null) {
      throw ArgumentError('not a rss feed');
    }
    final channelElement = (rss ?? rdf)!.findElements('channel').firstOrNull;
    if (channelElement == null) {
      throw ArgumentError('channel not found');
    }
    return RssFeed(
      title: channelElement.findElements('title').firstOrNull?.innerText,
      author: channelElement.findElements('author').firstOrNull?.innerText,
      description:
          channelElement.findElements('description').firstOrNull?.innerText,
      link: channelElement.findElements('link').firstOrNull?.innerText,
      items: (rdf ?? channelElement)
          .findElements('item')
          .map(RssItem.parse)
          .toList(),
      image: (rdf ?? channelElement)
          .findElements('image')
          .map(RssImage.parse)
          .firstOrNull,
      cloud:
          channelElement.findElements('cloud').map(RssCloud.parse).firstOrNull,
      categories: channelElement
          .findElements('category')
          .map(RssCategory.parse)
          .toList(),
      skipDays: channelElement
              .findElements('skipDays')
              .firstOrNull
              ?.findAllElements('day')
              .map((e) => e.innerText)
              .toList() ??
          [],
      skipHours: channelElement
              .findElements('skipHours')
              .firstOrNull
              ?.findAllElements('hour')
              .map((e) => int.tryParse(e.innerText) ?? 0)
              .toList() ??
          [],
      lastBuildDate:
          channelElement.findElements('lastBuildDate').firstOrNull?.innerText,
      language: channelElement.findElements('language').firstOrNull?.innerText,
      generator:
          channelElement.findElements('generator').firstOrNull?.innerText,
      copyright:
          channelElement.findElements('copyright').firstOrNull?.innerText,
      docs: channelElement.findElements('docs').firstOrNull?.innerText,
      managingEditor:
          channelElement.findElements('managingEditor').firstOrNull?.innerText,
      rating: channelElement.findElements('rating').firstOrNull?.innerText,
      webMaster:
          channelElement.findElements('webMaster').firstOrNull?.innerText,
      ttl: int.tryParse(
        channelElement.findElements('ttl').firstOrNull?.innerText ?? '0',
      ),
      dc: DublinCore.parse(channelElement),
      itunes: Itunes.parse(channelElement),
      syndication: Syndication.parse(channelElement),
    );
  }

  /// The title of the feed
  final String? title;

  /// The author of the feed
  final String? author;

  /// The description of the feed
  final String? description;

  /// The link of the feed
  final String? link;

  /// The items of the feed
  final List<RssItem>? items;

  /// The image of the feed
  final RssImage? image;

  /// The cloud of the feed
  final RssCloud? cloud;

  /// The categories of the feed
  final List<RssCategory>? categories;

  /// The skip days of the feed
  final List<String>? skipDays;

  /// The skip hours of the feed
  final List<int>? skipHours;

  /// The last build date of the feed
  final String? lastBuildDate;

  /// The language of the feed
  final String? language;

  /// The generator of the feed
  final String? generator;

  /// The copyright of the feed
  final String? copyright;

  /// The docs of the feed
  final String? docs;

  /// The managing editor of the feed
  final String? managingEditor;

  /// The rating of the feed
  final String? rating;

  /// The web master of the feed
  final String? webMaster;

  /// The ttl of the feed
  final int? ttl;

  /// The DublinCore of the feed
  final DublinCore? dc;

  /// The Itunes of the feed
  final Itunes? itunes;

  /// The Syndication of the feed
  final Syndication? syndication;
}
