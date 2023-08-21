import 'package:perla_test/core/services/note_data_base_serives.dart';

import '../../domain/usecases/add_note_usecase.dart';
import '../../domain/usecases/edit_note_usecase.dart';
import '../model/note_model.dart';
import 'base_home_data_source.dart';

class HomeDataSource extends BaseHomeDataSource {
  @override
  Future<List<NoteModel>> addNote(AddNoteParameters parameters) async {
    return NoteDataBaseSerives.instance.createNote(parameters.toJson());
  }

  @override
  Future<List<NoteModel>> deleteNote(int id) async {
    return NoteDataBaseSerives.instance.delete(id);
  }

  @override
  Future<List<NoteModel>> editNote(EditNoteParameters parameters) async {
    return NoteDataBaseSerives.instance
        .update(parameters.noteId, parameters.toJson());
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    return NoteDataBaseSerives.instance.readAllNotes();
  }
}
