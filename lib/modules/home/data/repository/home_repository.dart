import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/handler.dart';
import '../../domain/entities/note_entity.dart';
import '../../domain/repository/base_home_repository.dart';
import '../../domain/usecases/add_note_usecase.dart';
import '../../domain/usecases/edit_note_usecase.dart';
import '../data_source/base_home_data_source.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeDataSource baseHomeDataSource;
  HomeRepository(this.baseHomeDataSource);
  @override
  Future<Either<Failure, List<NoteEntity>>> addNote(
      AddNoteParameters parameters) {
    return ExceptionsHandler.handleLocalException(
        () => baseHomeDataSource.addNote(parameters));
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> deleteNote(int id) {
    return ExceptionsHandler.handleLocalException(
        () => baseHomeDataSource.deleteNote(id));
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> editNote(
      EditNoteParameters parameters) {
    return ExceptionsHandler.handleLocalException(
        () => baseHomeDataSource.editNote(parameters));
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> getAllNotes() {
    return ExceptionsHandler.handleLocalException(
        () => baseHomeDataSource.getAllNotes());
  }
}
