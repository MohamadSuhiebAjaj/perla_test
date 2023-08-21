import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:perla_test/modules/home/domain/usecases/add_note_usecase.dart';
import 'package:perla_test/modules/home/domain/usecases/edit_note_usecase.dart';
import 'package:perla_test/modules/home/domain/usecases/get_all_notes_usecase.dart';

import '../../../domain/entities/note_entity.dart';
import '../../../domain/usecases/delete_note_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllNoteUseCase getAllNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;
  final EditNoteUsecase editNoteUsecase;
  final AddNoteUseCase addNoteUseCase;
  HomeBloc(
    this.addNoteUseCase,
    this.deleteNoteUseCase,
    this.editNoteUsecase,
    this.getAllNoteUseCase,
  ) : super(HomeInitial()) {
    on<GetAllNotesEvent>(_getAllNotes);
    on<EditNoteEvent>(_editNote);
    on<AddNoteEvent>(_addNote);
    on<DeleteNoteEvent>(_deleteNote);
  }

  FutureOr<void> _getAllNotes(GetAllNotesEvent event, emit) async {
    emit(LoadingHomeState());
    final result = await getAllNoteUseCase();
    result.fold((l) {
      emit(FailureHomeState(l.message));
    }, (r) {
      emit(SuccessHomeState(r));
    });
  }

  FutureOr<void> _editNote(EditNoteEvent event, emit) async {
    emit(LoadingHomeState());
    final result = await editNoteUsecase(
      EditNoteParameters(
        text: event.text,
        noteId: event.id,
      ),
    );
    result.fold((l) {
      emit(FailureHomeState(l.message));
    }, (r) {
      emit(SuccessHomeState(r));
    });
  }

  FutureOr<void> _addNote(AddNoteEvent event, emit) async {
    emit(LoadingHomeState());
    final result = await addNoteUseCase(AddNoteParameters(event.text));
    result.fold((l) {
      emit(FailureHomeState(l.message));
    }, (r) {
      emit(SuccessHomeState(r));
    });
  }

  FutureOr<void> _deleteNote(DeleteNoteEvent event, emit) async {
    emit(LoadingHomeState());
    final result = await deleteNoteUseCase(event.id);
    result.fold((l) {
      emit(FailureHomeState(l.message));
    }, (r) {
      emit(SuccessHomeState(r));
    });
  }
}
