import 'package:flutter_clean_arquitecture/src/app/features/notes/domain/repositories/note_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class IncreaseCountUsecase {
  final NoteRepository _repository;
  IncreaseCountUsecase(this._repository);
  Future<void> call() async {
    _repository.increaseFavouriteNoteCount();
  }
}
