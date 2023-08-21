import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_cases.dart';
import '../entities/note_entity.dart';
import '../repository/base_home_repository.dart';


class GetAllNoteUseCase extends NoParametersBaseUseCase<List<NoteEntity>> {
  final BaseHomeRepository baseHomeRepository;
  GetAllNoteUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, List<NoteEntity>>> call(
      [NoParameters parameters = const NoParameters()]) {
    return baseHomeRepository.getAllNotes();
  }
}
