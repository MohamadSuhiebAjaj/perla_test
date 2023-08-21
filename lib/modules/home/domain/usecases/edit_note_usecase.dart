// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/note_data_base_serives.dart';
import '../../../../core/usecase/base_use_cases.dart';
import '../entities/note_entity.dart';
import '../repository/base_home_repository.dart';

class EditNoteUsecase extends BaseUseCase<List<NoteEntity>, EditNoteParameters> {
  final BaseHomeRepository baseHomeRepository;
  EditNoteUsecase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<NoteEntity>>> call(EditNoteParameters parameters) {
    return baseHomeRepository.editNote(parameters);
  }
}

class EditNoteParameters extends Equatable {
  final String text;
  final int noteId;

  const EditNoteParameters({
    required this.text,
    required this.noteId,
  });

  Map<String, dynamic> toJson() => {
        NoteFields.id: noteId,
        NoteFields.text: text,
        NoteFields.createdAt: DateTime.now().toIso8601String()
      };

  @override
  List<Object> get props => [text, noteId];
}
