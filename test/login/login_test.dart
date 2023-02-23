import 'package:b7c_clean_architecture/domain/entity/login/request_login_entity.dart';
import 'package:b7c_clean_architecture/domain/entity/login/response_login_entity.dart';
import 'package:b7c_clean_architecture/features/logins/login/services/login_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginServices extends Mock implements LoginServices {}

class MockBuildContext extends Mock implements BuildContext {}

Future<void> main() async {
  late LoginServices loginRepository;
  late MockBuildContext mockBuildContext;

  setUpAll(() async {
    await dotenv.load(fileName: ".env.dev");
  });

  setUp(() {
    loginRepository = MockLoginServices();
    mockBuildContext = MockBuildContext();
  });

  group('Example Services Login Test', () {
    testWidgets('Success', (tester) async {
      // RequestLoginEntity requestLoginEntity =
      //     // RequestLoginEntity(email: 'kminchelle', katasandi: '0lelplR');

      //     when(() => loginRepository.apiLogin(mockBuildContext,
      //             path: '/auth/login', requestLoginEntity: requestLoginEntity))
      //         .thenAnswer((_) => Future.value(
      //               ResponseLoginEntity(
      //                 token: 'token',
      //               ),
      //             ));

      // var response = await loginRepository.apiLogin(
      //   mockBuildContext,
      //   path: '/auth/login',
      //   requestLoginEntity: requestLoginEntity,
      // );
      // expect(response?.token, isNotEmpty);
    });

    testWidgets('Faild', (widgetTester) async {
      // RequestLoginEntity requestLoginEntity =
      // RequestLoginEntity(email: '', katasandi: '');

      // when(() => loginRepository.apiLogin(mockBuildContext,
      //         path: '/auth/login', requestLoginEntity: requestLoginEntity))
      //     .thenAnswer((_) => Future.value(null));

      // var response = await loginRepository.apiLogin(
      //   mockBuildContext,
      //   path: '/auth/login',
      //   requestLoginEntity: requestLoginEntity,
      // );
      // expect(response?.token, isNull);
    });
  });
}
