import 'package:perla_test/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecase/base_use_cases.dart';
import '../entities/note_entity.dart';
import '../repository/base_home_repository.dart';

class DeleteNoteUseCase extends BaseUseCase<List<NoteEntity>, int> {
  final BaseHomeRepository baseHomeRepository;
  DeleteNoteUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<NoteEntity>>> call(int parameters) {
    return baseHomeRepository.deleteNote(parameters);
  }
}
