import 'package:flutter_clean_arquitecture/src/common/network/api/local_api_client.dart';
import 'package:flutter_clean_arquitecture/src/common/utils/constants/preferences_keys.dart';
import 'package:injectable/injectable.dart';
import 'notes_local_datasource.dart';

@Injectable(as: NotesLocalDataSource)
class NotesLocalDataSourceImplements implements NotesLocalDataSource {
  final LocalApiClient _localApiClient;
  NotesLocalDataSourceImplements(this._localApiClient);
  @override
  Future<void> decrementFavouriteCount() async{
    try {
      var currentCount = _localApiClient.getint(PreferencesKeys.favoriteCount);
      currentCount--;
      await _localApiClient.setInt(PreferencesKeys.favoriteCount, value: currentCount);
    } catch (_) {
      //Atrapar cualquier excepción generada en el bloque try
      //rethrow lanza la misma excepción al sitio donde se invoque al metodo
      rethrow;
    }
  }

  @override
  Future<void> incrementFavouriteCount() async{
    try {
      var currentCount = _localApiClient.getint(PreferencesKeys.favoriteCount);
      currentCount++;
      await _localApiClient.setInt(PreferencesKeys.favoriteCount, value: currentCount);
    } catch (_) {
      //Atrapar cualquier excepción generada en el bloque try
      //rethrow lanza la misma excepción al sitio donde se invoque al metodo
      rethrow;
    }
  }
}
