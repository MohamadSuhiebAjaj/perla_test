// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:perla_test/core/services/note_data_base_serives.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_cases.dart';
import '../entities/note_entity.dart';
import '../repository/base_home_repository.dart';

class AddNoteUseCase extends BaseUseCase<List<NoteEntity>, AddNoteParameters> {
  final BaseHomeRepository baseHomeRepository;
  AddNoteUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<NoteEntity>>> call(AddNoteParameters parameters) {
    return baseHomeRepository.addNote(parameters);
  }
}

class AddNoteParameters extends Equatable {
  final String text;
  const AddNoteParameters(this.text);

  Map<String, dynamic> toJson() => {
        NoteFields.text: text,
        NoteFields.createdAt: DateTime.now().toIso8601String()
      };

  @override
  List<Object> get props => [text];
}
