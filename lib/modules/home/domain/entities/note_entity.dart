import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  final int id;
  final String text;
  final DateTime createdAt;

  const NoteEntity({
    required this.id,
    required this.text,
    required this.createdAt,
  });

  @override
  List<Object> get props => [id, text, createdAt];
}
