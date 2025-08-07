import 'package:webfeed_revised/domain/media/category.dart';
import 'package:webfeed_revised/domain/media/community.dart';
import 'package:webfeed_revised/domain/media/content.dart';
import 'package:webfeed_revised/domain/media/copyright.dart';
import 'package:webfeed_revised/domain/media/credit.dart';
import 'package:webfeed_revised/domain/media/description.dart';
import 'package:webfeed_revised/domain/media/embed.dart';
import 'package:webfeed_revised/domain/media/group.dart';
import 'package:webfeed_revised/domain/media/hash.dart';
import 'package:webfeed_revised/domain/media/license.dart';
import 'package:webfeed_revised/domain/media/peer_link.dart';
import 'package:webfeed_revised/domain/media/player.dart';
import 'package:webfeed_revised/domain/media/price.dart';
import 'package:webfeed_revised/domain/media/rating.dart';
import 'package:webfeed_revised/domain/media/restriction.dart';
import 'package:webfeed_revised/domain/media/rights.dart';
import 'package:webfeed_revised/domain/media/scene.dart';
import 'package:webfeed_revised/domain/media/status.dart';
import 'package:webfeed_revised/domain/media/text.dart';
import 'package:webfeed_revised/domain/media/thumbnail.dart';
import 'package:webfeed_revised/domain/media/title.dart';
import 'package:webfeed_revised/util/iterable.dart';
import 'package:webfeed_revised/util/xml.dart';
import 'package:xml/xml.dart';

/// The Media element
/// See https://www.rssboard.org/media-rss
class Media {
  /// Default constructor for the Media class
  Media({
    this.group,
    this.contents,
    this.credits,
    this.category,
    this.rating,
    this.title,
    this.description,
    this.keywords,
    this.thumbnails,
    this.hash,
    this.player,
    this.copyright,
    this.text,
    this.restriction,
    this.community,
    this.comments,
    this.embed,
    this.responses,
    this.backLinks,
    this.status,
    this.prices,
    this.license,
    this.peerLink,
    this.rights,
    this.scenes,
  });

  /// Parse constructor for the Media class, used when 'parsing' a feed
  factory Media.parse(XmlElement element) => Media(
        group: element.findElements('media:group').map(Group.parse).firstOrNull,
        contents:
            element.findElements('media:content').map(Content.parse).toList(),
        credits:
            element.findElements('media:credit').map(Credit.parse).toList(),
        category: element
            .findElements('media:category')
            .map(Category.parse)
            .firstOrNull,
        rating:
            element.findElements('media:rating').map(Rating.parse).firstOrNull,
        title:
            findElements(element, 'media:title')?.map(Title.parse).firstOrNull,
        description: element
            .findElements('media:description')
            .map(Description.parse)
            .firstOrNull,
        keywords: element.findElements('media:keywords').firstOrNull?.innerText,
        thumbnails: element
            .findElements('media:thumbnail')
            .map(Thumbnail.parse)
            .toList(),
        hash: element.findElements('media:hash').map(Hash.parse).firstOrNull,
        player:
            element.findElements('media:player').map(Player.parse).firstOrNull,
        copyright: element
            .findElements('media:copyright')
            .map(Copyright.parse)
            .firstOrNull,
        text: element.findElements('media:text').map(Text.parse).firstOrNull,
        restriction: element
            .findElements('media:restriction')
            .map(Restriction.parse)
            .firstOrNull,
        community: element
            .findElements('media:community')
            .map(Community.parse)
            .firstOrNull,
        comments: element
                .findElements('media:comments')
                .firstOrNull
                ?.findElements('media:comment')
                .map((e) => e.innerText)
                .toList() ??
            [],
        embed: element.findElements('media:embed').map(Embed.parse).firstOrNull,
        responses: element
                .findElements('media:responses')
                .firstOrNull
                ?.findElements('media:response')
                .map((e) => e.innerText)
                .toList() ??
            [],
        backLinks: element
                .findElements('media:backLinks')
                .firstOrNull
                ?.findElements('media:backLink')
                .map((e) => e.innerText)
                .toList() ??
            [],
        status:
            element.findElements('media:status').map(Status.parse).firstOrNull,
        prices: element.findElements('media:price').map(Price.parse).toList(),
        license: element
            .findElements('media:license')
            .map(License.parse)
            .firstOrNull,
        peerLink: element
            .findElements('media:peerLink')
            .map(PeerLink.parse)
            .firstOrNull,
        rights:
            element.findElements('media:rights').map(Rights.parse).firstOrNull,
        scenes: element
                .findElements('media:scenes')
                .firstOrNull
                ?.findElements('media:scene')
                .map(Scene.parse)
                .toList() ??
            [],
      );

  /// The group of the media element
  final Group? group;

  /// The contents of the media element
  final List<Content>? contents;

  /// The credits of the media element
  final List<Credit>? credits;

  /// The category of the media element
  final Category? category;

  /// The rating of the media element
  final Rating? rating;

  /// The title of the media element
  final Title? title;

  /// The description of the media element
  final Description? description;

  /// The keywords of the media element
  final String? keywords;

  /// The thumbnails of the media element
  final List<Thumbnail>? thumbnails;

  /// The hash of the media element
  final Hash? hash;

  /// The player of the media element
  final Player? player;

  /// The copyright of the media element
  final Copyright? copyright;

  /// The text of the media element
  final Text? text;

  /// The restriction of the media element
  final Restriction? restriction;

  /// The community of the media element
  final Community? community;

  /// The comments of the media element
  final List<String>? comments;

  /// The embed of the media element
  final Embed? embed;

  /// The responses of the media element
  final List<String>? responses;

  /// The backLinks of the media element
  final List<String>? backLinks;

  /// The status of the media element
  final Status? status;

  /// The prices of the media element
  final List<Price>? prices;

  /// The license of the media element
  final License? license;

  /// The peerLink of the media element
  final PeerLink? peerLink;

  /// The rights of the media element
  final Rights? rights;

  /// The scenes of the media element
  final List<Scene>? scenes;
}
