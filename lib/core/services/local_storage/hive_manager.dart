import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static const String _boxName = 'settingsBox';
  static const String _themeKey = 'theme';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_boxName);
  }

  static Future<void> saveTheme(String theme) async {
    final box = Hive.box(_boxName);
    await box.put(_themeKey, theme);
  }

  static String getTheme() {
    final box = Hive.box(_boxName);
    return box.get(_themeKey, defaultValue: 'light');
  }
}
