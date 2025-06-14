import 'package:flutter_clean_arquitecture/src/app/features/notes/data/source/local/notes_local_datasource.dart';
import 'package:flutter_clean_arquitecture/src/app/features/notes/data/source/remote/notes_remote_datasource.dart';
import 'package:flutter_clean_arquitecture/src/app/features/notes/domain/models/note_model.dart';
import 'package:flutter_clean_arquitecture/src/app/features/notes/domain/repositories/note_repository.dart';
import 'package:flutter_clean_arquitecture/src/common/network/error/api_error.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NoteRepository)
class NoteRepositoryImplements implements NoteRepository {
  final NotesLocalDataSource _localDataSource;
  final NotesRemoteDataSource _remoteDataSource;
  NoteRepositoryImplements(this._localDataSource, this._remoteDataSource);
  @override
  Future<Either<ApiError, NoteModel>> createNote({required NoteModel note}) async{
    try {
      final createdNote = await _remoteDataSource.createNote(note: note);
      await _localDataSource.incrementFavouriteCount();
      return Right(createdNote);  
    } catch (e) {
      return Left(e as ApiError);
    }
  }

  @override
  Future<void> decreaseFavouriteCount() async{
    await _localDataSource.decrementFavouriteCount();
  }

  @override
  Future<Either<ApiError, bool>> deleteNote({required int noteId}) async{
    try{
      final notewasDeleted = await _remoteDataSource.deleteteNote(noteId: noteId);
      return Right(notewasDeleted);
    }catch(e){
      return Left(e as ApiError);
    }
  }

  @override
  Future<Either<ApiError, List<NoteModel>>> getNotes() async{
    try{
    final notes = await _remoteDataSource.getNotes();
    return Right(notes);
    }catch(e){
      return Left(e as ApiError);
    }
  }

  @override
  Future<void> increaseFavouriteNoteCount() async {
    await _localDataSource.incrementFavouriteCount();
  }
}
