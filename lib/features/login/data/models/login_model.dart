import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String token;

  const LoginModel({required this.token});

  @override
  List<Object?> get props => [token];

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = json['data'] as Map<String, dynamic>;
    return LoginModel(token: data['token']);
  }

  Map<String, dynamic> toJson() {
    return {
      "data": {"token": token},
      "err": 0
    };
  }
}
