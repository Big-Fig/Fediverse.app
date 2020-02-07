import 'package:hive/hive.dart';

class AppSettings {
  static Future<void> setTimelineRepliesSetting(bool hide) async {
    var box = await Hive.openBox('AppSettings', lazy: true) as LazyBox;
    await box.put("hide_replies", hide);
  }

  static Future<bool> getTimelineRepliesSetting() async {
    var box = await Hive.openBox('AppSettings', lazy: true) as LazyBox;
    bool setting = await box.get("hide_replies");
    if (setting == null) return false;
    return setting;
  }

  static Future<void> setTimelineMediaGridSetting(bool hide) async {
    var box = await Hive.openBox('AppSettings', lazy: true) as LazyBox;
    await box.put("media_only", hide);
  }

  static Future<bool> getTimelineMediaGridSetting() async {
    var box = await Hive.openBox('AppSettings', lazy: true) as LazyBox;
    bool setting = await box.get("media_only");
    if (setting == null) return false;
    return setting;
  }

  static Future<void> setTimelineHideNSFWSetting(bool hide) async {
    var box = await Hive.openBox('AppSettings', lazy: true) as LazyBox;
    await box.put("hide_nsfw", hide);
  }

  static Future<bool> getTimelineHideNSFWSetting() async {
    var box = await Hive.openBox('AppSettings', lazy: true) as LazyBox;
    bool setting = await box.get("hide_nsfw");
    if (setting == null) return false;
    return setting;
  }
}
