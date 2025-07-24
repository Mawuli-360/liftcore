import 'package:shared_preferences/shared_preferences.dart';

 /* -------------------------------------------------------------------- */
 /*           Service class to handle local storage operations           */
 /* -------------------------------------------------------------------- */
class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  LocalStorageService._();

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService._();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // String operations
  Future<bool> setString(String key, String value) async {
    return await _preferences?.setString(key, value) ?? false;
  }

  String getString(String key, {String defaultValue = ''}) {
    return _preferences?.getString(key) ?? defaultValue;
  }

  // Boolean operations
  Future<bool> setBool(String key, bool value) async {
    return await _preferences?.setBool(key, value) ?? false;
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _preferences?.getBool(key) ?? defaultValue;
  }

  // Integer operations
  Future<bool> setInt(String key, int value) async {
    return await _preferences?.setInt(key, value) ?? false;
  }

  int getInt(String key, {int defaultValue = 0}) {
    return _preferences?.getInt(key) ?? defaultValue;
  }

  // Double operations
  Future<bool> setDouble(String key, double value) async {
    return await _preferences?.setDouble(key, value) ?? false;
  }

  double getDouble(String key, {double defaultValue = 0.0}) {
    return _preferences?.getDouble(key) ?? defaultValue;
  }

  // String List operations
  Future<bool> setStringList(String key, List<String> value) async {
    return await _preferences?.setStringList(key, value) ?? false;
  }

  List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return _preferences?.getStringList(key) ?? defaultValue;
  }

  // Remove and clear operations
  Future<bool> remove(String key) async {
    return await _preferences?.remove(key) ?? false;
  }

  Future<bool> clear() async {
    return await _preferences?.clear() ?? false;
  }

  bool containsKey(String key) {
    return _preferences?.containsKey(key) ?? false;
  }
}
