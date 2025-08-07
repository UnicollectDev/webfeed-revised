import 'package:webfeed_revised/domain/itunes/itunes_category.dart';
import 'package:webfeed_revised/domain/itunes/itunes_episode_type.dart';
import 'package:webfeed_revised/domain/itunes/itunes_image.dart';
import 'package:webfeed_revised/domain/itunes/itunes_owner.dart';
import 'package:webfeed_revised/domain/itunes/itunes_type.dart';
import 'package:webfeed_revised/util/iterable.dart';
import 'package:webfeed_revised/util/xml.dart';
import 'package:xml/xml.dart';

/// The iTunes specific feed information
/// See https://help.apple.com/itc/podcasts_connect/#/itcb54353390
class Itunes {
  /// Default constructor for the Itunes class
  Itunes({
    this.author,
    this.summary,
    this.explicit,
    this.title,
    this.subtitle,
    this.owner,
    this.keywords,
    this.image,
    this.categories,
    this.type,
    this.newFeedUrl,
    this.block,
    this.complete,
    this.episode,
    this.season,
    this.duration,
    this.episodeType,
  });

  /// Parse constructor for the Itunes class, used when 'parsing' a feed
  factory Itunes.parse(XmlElement element) {
    final episodeStr =
        element.findElements('itunes:episode').firstOrNull?.innerText ?? '';
    final seasonStr =
        element.findElements('itunes:season').firstOrNull?.innerText ?? '';
    final durationStr =
        element.findElements('itunes:duration').firstOrNull?.innerText ?? '';
    return Itunes(
      author: element.findElements('itunes:author').firstOrNull?.innerText,
      summary: element.findElements('itunes:summary').firstOrNull?.innerText,
      explicit: parseBoolLiteral(element, 'itunes:explicit'),
      title: element.findElements('itunes:title').firstOrNull?.innerText,
      subtitle: element.findElements('itunes:subtitle').firstOrNull?.innerText,
      owner: element
          .findElements('itunes:owner')
          .map(ItunesOwner.parse)
          .firstOrNull,
      keywords: element
              .findElements('itunes:keywords')
              .firstOrNull
              ?.innerText
              .split(',')
              .map((keyword) => keyword.trim())
              .toList() ??
          [],
      image: element
          .findElements('itunes:image')
          .map(ItunesImage.parse)
          .firstOrNull,
      categories: element
          .findElements('itunes:category')
          .map(ItunesCategory.parse)
          .toList(),
      type: element.findElements('itunes:type').map(newItunesType).firstOrNull,
      newFeedUrl:
          element.findElements('itunes:new-feed-url').firstOrNull?.innerText,
      block: parseBoolLiteral(element, 'itunes:block'),
      complete: parseBoolLiteral(element, 'itunes:complete'),
      episode: episodeStr.isNotEmpty ? int.tryParse(episodeStr) : null,
      season: seasonStr.isNotEmpty ? int.tryParse(seasonStr) : null,
      duration: durationStr.isNotEmpty ? _parseDuration(durationStr) : null,
      episodeType: element
          .findElements('itunes:episodeType')
          .map(newItunesEpisodeType)
          .firstOrNull,
    );
  }

  /// The author of the podcast
  final String? author;

  /// The summary of the podcast
  final String? summary;

  /// Whether the podcast is explicit or not
  final bool? explicit;

  /// The title of the podcast
  final String? title;

  /// The subtitle of the podcast
  final String? subtitle;

  /// The podcast owner contact information
  final ItunesOwner? owner;

  /// The keywords of the podcast
  final List<String>? keywords;

  /// The image of the podcast
  final ItunesImage? image;

  /// The categories of the podcast
  final List<ItunesCategory>? categories;

  /// The type of the podcast
  final ItunesType? type;

  /// The new feed url of the podcast
  final String? newFeedUrl;

  /// Whether the podcast is blocked or not
  final bool? block;

  /// Whether the podcast is complete or not
  final bool? complete;

  /// The episode number of the podcast
  final int? episode;

  /// The season number of the podcast
  final int? season;

  /// The duration of the podcast
  final Duration? duration;

  /// The episode type of the podcast
  final ItunesEpisodeType? episodeType;

  static Duration _parseDuration(String s) {
    var hours = 0;
    var minutes = 0;
    var seconds = 0;
    final parts = s.split(':');
    if (parts.length > 2) {
      hours = int.tryParse(parts[parts.length - 3]) ?? 0;
    }
    if (parts.length > 1) {
      minutes = int.tryParse(parts[parts.length - 2]) ?? 0;
    }
    seconds = int.tryParse(parts[parts.length - 1]) ?? 0;
    return Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }
}
