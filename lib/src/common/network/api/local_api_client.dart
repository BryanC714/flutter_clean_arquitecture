import 'package:safe_extensions/safe_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalApiClient {
  late SharedPreferences _preferences;
  static Future<LocalApiClient> init() async {
    var client = LocalApiClient._();

    client._preferences = await SharedPreferences.getInstance();
    return client;
  }

  //constructor privado
  LocalApiClient._();

  Future<bool> setString(String key, {required String value}) async {
    return await _preferences.setString(key, value);
  }

  String getString(String key) {
    return _preferences.getString(key).safeValue;
  }

  Future<bool> setInt(String key, {required int value}) async {
    return await _preferences.setInt(key, value);
  }

  int getint(String key) {
    return _preferences.getInt(key).safeValue;
  }

  Future<bool> setBool(String key, {required bool value}) async {
    return await _preferences.setBool(key, value);
  }

  bool getBool(String key) {
    return _preferences.getBool(key).safeValue;
  }

  Future<void> reomve(String key) async {
    await _preferences.remove(key);
  }

  Future<bool> setDouble(String key, {required double value}) async {
    return await _preferences.setDouble(key, value);
  }

  double getDouble(String key) {
    return _preferences.getDouble(key).safeValue;
  }
  
}
