import '../models/note_model.dart';
import '../repositories/note_repository.dart';
import 'package:flutter_clean_arquitecture/src/common/network/error/api_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
//@injectable: permite que la clase sea intyectada automaticamente
//utilizando el paquete get_it
//la anotacion injectable permite que esta clase sea registrada e inyectada automaticamente en otras clases
//No se sabe si los datos vienen de API, SQLLite, etc
@injectable
class GetNotesUsecase {
  //Inyeccion de dependencias
  final NoteRepository _repository;
  GetNotesUsecase(this._repository);

  Future<Either<ApiError, List<NoteModel>>> call() async {
    return await _repository.getNotes();
  }
}