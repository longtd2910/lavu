import 'package:flutter_test/flutter_test.dart';
import 'package:lavu/features/token_auth/domain/repositories/token_auth_repository.dart';
import 'package:lavu/features/token_auth/domain/usecases/auth_token.dart';
import 'package:mockito/mockito.dart';

class MockTokenAuthRepository extends Mock implements TokenAuthRepository {}

void main() {
  AuthToken usecase;
  MockTokenAuthRepository mockTokenAuthRepository;

  setUp(() {
    mockTokenAuthRepository = MockTokenAuthRepository();
    usecase = AuthToken(mockTokenAuthRepository);
  });
}
