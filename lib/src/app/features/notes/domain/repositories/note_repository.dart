import '../models/note_model.dart';
import 'package:flutter_clean_arquitecture/src/common/network/error/api_error.dart';
import 'package:fpdart/fpdart.dart';

abstract class NoteRepository {
  Future<Either<ApiError, List<NoteModel>>> getNotes();
  Future<Either<ApiError, NoteModel>> createNote({required NoteModel note});
  Future<Either<ApiError, bool>> deleteNote({required int noteId});
  Future<void> increaseFavouriteNoteCount();
  Future<void> decreaseFavouriteCount();
}
