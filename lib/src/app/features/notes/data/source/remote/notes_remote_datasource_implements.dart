import 'package:flutter_clean_arquitecture/src/app/features/notes/domain/models/note_model.dart';
import 'package:flutter_clean_arquitecture/src/common/network/api/remote_api_client.dart';
import 'package:flutter_clean_arquitecture/src/common/network/error/api_error.dart';
import 'package:injectable/injectable.dart';
import 'notes_remote_datasource.dart';

@Injectable(as: NotesRemoteDatasourceImplements)
class NotesRemoteDatasourceImplements implements NotesRemoteDataSource {
  final RemoteApiClient _remoteApiClient;
  NotesRemoteDatasourceImplements(this._remoteApiClient);
  @override
  Future<NoteModel> createNote({required NoteModel note}) async{
    try {
      final response=await _remoteApiClient.post('/notes',data:note.toJson());
      return NoteModel.fromJson(response.data);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  @override
  Future<bool> deleteteNote({required int noteId}) {
    try{
      return _remoteApiClient.delete('/notes/$noteId').then((response) {
        return response.statusCode == 200;
      });
    }catch(e){
      throw ApiError.fromDioError(e);
    }
  }

  @override
  Future<List<NoteModel>> getNotes() async{
    try {
      final response=await _remoteApiClient.get('/notes');
      return (response.data as List).map((note)=>NoteModel.fromJson(note)).toList();
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }
}
