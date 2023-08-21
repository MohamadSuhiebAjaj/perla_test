import '../../../../core/services/note_data_base_serives.dart';
import '../../domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  const NoteModel({
    required super.id,
    required super.text,
    required super.createdAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json[NoteFields.id],
      text: json[NoteFields.text],
      createdAt: DateTime.parse(json[NoteFields.createdAt]),
    );
  }

  Map<String, dynamic> toJson() => {
        NoteFields.id: id,
        NoteFields.text: text,
        NoteFields.createdAt: createdAt,
      };
}
