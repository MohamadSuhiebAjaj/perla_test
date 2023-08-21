// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String fullName;
  final String phoneNumber;

  const UserEntity({
    required this.fullName,
    required this.phoneNumber,
    required this.id,
  });

  @override
  List<Object> get props => [fullName, phoneNumber];
}
