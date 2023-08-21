import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.fullName,
    required super.phoneNumber,
    required super.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['username'],
      phoneNumber: json['phone'],
      id: json['id'],
    );
  }
}
