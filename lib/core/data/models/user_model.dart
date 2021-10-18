import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String id,
    required String name,
  }) : super(id: id, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = json['data'] as Map<String, dynamic>;
    return UserModel(
      id: data['id'],
      name: data['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'id': id,
        'name': name,
      },
      'err': 0,
    };
  }
}
