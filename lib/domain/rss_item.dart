import 'package:webfeed_revised/domain/dublin_core/dublin_core.dart';
import 'package:webfeed_revised/domain/itunes/itunes.dart';
import 'package:webfeed_revised/domain/media/media.dart';
import 'package:webfeed_revised/domain/rss_category.dart';
import 'package:webfeed_revised/domain/rss_content.dart';
import 'package:webfeed_revised/domain/rss_enclosure.dart';
import 'package:webfeed_revised/domain/rss_source.dart';
import 'package:webfeed_revised/util/datetime.dart';
import 'package:webfeed_revised/util/function.dart';
import 'package:webfeed_revised/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents an RSS item
/// See https://www.rssboard.org/rss-specification#hrelementsOfLtitemgt
class RssItem {
  /// Default constructor for the RssItem class
  RssItem({
    this.title,
    this.description,
    this.link,
    this.categories,
    this.guid,
    this.pubDate,
    this.author,
    this.comments,
    this.source,
    this.content,
    this.media,
    this.enclosure,
    this.dc,
    this.itunes,
  });

  /// Parse constructor for the RssItem class, used when 'parsing' a feed
  factory RssItem.parse(XmlElement element) => RssItem(
        title: element.findElements('title').firstOrNull?.innerText,
        description: removeHtml(
          element.findElements('description').firstOrNull?.innerText,
        ),
        link: element.findElements('link').firstOrNull?.innerText,
        categories:
            element.findElements('category').map(RssCategory.parse).toList(),
        guid: element.findElements('guid').firstOrNull?.innerText,
        pubDate: parseDateTime(
          element.findElements('pubDate').firstOrNull?.innerText,
        ),
        author: element.findElements('author').firstOrNull?.innerText,
        comments: element.findElements('comments').firstOrNull?.innerText,
        source: element.findElements('source').map(RssSource.parse).firstOrNull,
        content: element
            .findElements('content:encoded')
            .map(RssContent.parse)
            .firstOrNull,
        media: Media.parse(element),
        enclosure: element
            .findElements('enclosure')
            .map(RssEnclosure.parse)
            .firstOrNull,
        dc: DublinCore.parse(element),
        itunes: Itunes.parse(element),
      );

  /// The title of the item
  final String? title;

  /// The description of the item
  final String? description;

  /// The link of the item
  final String? link;

  /// The categories of the item
  final List<RssCategory>? categories;

  /// The guid of the item
  final String? guid;

  /// The publishing date of the item
  final DateTime? pubDate;

  /// The author of the item
  final String? author;

  /// The comments of the item
  final String? comments;

  /// The source of the item
  final RssSource? source;

  /// The content of the item
  final RssContent? content;

  /// The media of the item
  final Media? media;

  /// The enclosure of the item
  final RssEnclosure? enclosure;

  /// The DublinCore of the item
  final DublinCore? dc;

  /// The Itunes of the item
  final Itunes? itunes;
}
