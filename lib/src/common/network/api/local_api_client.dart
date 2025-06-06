import 'package:safe_extensions/safe_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalApiClient {
  late SharedPreferences _preferences;
  static Future<LocalApiClient> init() async {
    var client = LocalApiClient._();

    client._preferences = await SharedPreferences.getInstance();
    return client;
  }
  LocalApiClient._();
}
