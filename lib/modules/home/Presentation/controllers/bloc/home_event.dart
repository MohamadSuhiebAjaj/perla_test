// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAllNotesEvent extends HomeEvent {}

class AddNoteEvent extends HomeEvent {
  final String text;
  const AddNoteEvent(this.text);
}

class DeleteNoteEvent extends HomeEvent {
  final int id;
  const DeleteNoteEvent(this.id);
}

class EditNoteEvent extends HomeEvent {
  final String text;
  final int id;
  const EditNoteEvent({required this.id, required this.text});
}
