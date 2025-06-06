import 'package:flutter_clean_arquitecture/src/app/features/notes/domain/repositories/note_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DecreaseCountUsecas {
  final NoteRepository _repository;
  DecreaseCountUsecas(this._repository);

  Future<void> call() async {
    return _repository.decreaseFavouriteCount();
  }
}
