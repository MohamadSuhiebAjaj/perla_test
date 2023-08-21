import '../../domain/usecases/add_note_usecase.dart';
import '../../domain/usecases/edit_note_usecase.dart';
import '../model/note_model.dart';

abstract class BaseHomeDataSource {
  Future<List<NoteModel>> getAllNotes();
  Future<List<NoteModel>> addNote(AddNoteParameters parameters);
  Future<List<NoteModel>> deleteNote(int id);
  Future<List<NoteModel>> editNote(EditNoteParameters parameters);
}
