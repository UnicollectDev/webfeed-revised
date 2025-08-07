import 'package:webfeed_revised/util/iterable.dart';
import 'package:xml/xml.dart';

/// Used to specify a scene of a media element
/// See https://www.rssboard.org/media-rss#media-scene
class Scene {
  /// Default constructor for the Scene class
  Scene({
    this.title,
    this.description,
    this.startTime,
    this.endTime,
  });

  /// Parse constructor for the Scene class, used when 'parsing' a feed
  factory Scene.parse(XmlElement element) => Scene(
        title: element.findElements('sceneTitle').firstOrNull?.innerText,
        description:
            element.findElements('sceneDescription').firstOrNull?.innerText,
        startTime:
            element.findElements('sceneStartTime').firstOrNull?.innerText,
        endTime: element.findElements('sceneEndTime').firstOrNull?.innerText,
      );

  /// The title of the scene
  final String? title;

  /// The description of the scene
  final String? description;

  /// The start time of the scene
  final String? startTime;

  /// The end time of the scene
  final String? endTime;
}
