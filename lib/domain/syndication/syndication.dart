import 'package:webfeed_revised/util/datetime.dart';
import 'package:webfeed_revised/util/iterable.dart';
import 'package:xml/xml.dart';

/// Type of update period
enum SyndicationUpdatePeriod {
  /// Hourly update period
  hourly,

  /// Daily update period
  daily,

  /// Weekly update period
  weekly,

  /// Monthly update period
  monthly,

  /// Yearly update period
  yearly
}

/// Syndication information
class Syndication {
  /// Default constructor for the Syndication class
  Syndication({
    this.updatePeriod,
    this.updateFrequency,
    this.updateBase,
  });

  /// Parse constructor for the Syndication class, used when 'parsing' a feed
  factory Syndication.parse(XmlElement element) {
    SyndicationUpdatePeriod updatePeriod;
    switch (element.findElements('sy:updatePeriod').firstOrNull?.innerText) {
      case 'hourly':
        updatePeriod = SyndicationUpdatePeriod.hourly;
      case 'daily':
        updatePeriod = SyndicationUpdatePeriod.daily;
      case 'weekly':
        updatePeriod = SyndicationUpdatePeriod.weekly;
      case 'monthly':
        updatePeriod = SyndicationUpdatePeriod.monthly;
      case 'yearly':
        updatePeriod = SyndicationUpdatePeriod.yearly;
      default:
        updatePeriod = SyndicationUpdatePeriod.daily;
    }
    return Syndication(
      updatePeriod: updatePeriod,
      updateFrequency: int.tryParse(
        element.findElements('sy:updateFrequency').firstOrNull?.innerText ??
            '1',
      ),
      updateBase: parseDateTime(
        element.findElements('sy:updateBase').firstOrNull?.innerText,
      ),
    );
  }

  /// The update period
  final SyndicationUpdatePeriod? updatePeriod;

  /// The update frequency
  final int? updateFrequency;

  /// The update base
  final DateTime? updateBase;
}
