import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:lavu/core/data/models/user_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const UserModel model = UserModel(id: 'blb6JQJ7EyHVRtBmlOW3', name: 'Thạch Đức Long');
  test('should return a valid model from a valid JSON fixture', () {
    final Map<String, dynamic> jsonData = json.decode(fixture('token_auth_response.json'));
    final result = UserModel.fromJson(jsonData);

    expect(result, model);
  });
}
