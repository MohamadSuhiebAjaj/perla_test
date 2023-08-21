import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/note_entity.dart';
import '../usecases/add_note_usecase.dart';
import '../usecases/edit_note_usecase.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<NoteEntity>>> getAllNotes();
  Future<Either<Failure, List<NoteEntity>>> addNote(AddNoteParameters parameters);
  Future<Either<Failure, List<NoteEntity>>> deleteNote(int id);
  Future<Either<Failure, List<NoteEntity>>> editNote(EditNoteParameters parameters);
}
