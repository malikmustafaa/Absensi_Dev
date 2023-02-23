import 'package:flutter/cupertino.dart';
import 'package:b7c_clean_architecture/domain/entity/example/request_example_entity.dart';
import 'package:b7c_clean_architecture/domain/entity/example/response_example_entity.dart';
import 'package:b7c_clean_architecture/features/examples/example/services/example_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockExampleServices extends Mock implements ExampleServices {}

class MockBuildContext extends Mock implements BuildContext {}

Future<void> main() async {
  late ExampleServices loginRepository;
  late MockBuildContext mockBuildContext;

  setUpAll(() async {
    await dotenv.load(fileName: ".env.dev");
  });

  setUp(() {
    loginRepository = MockExampleServices();
    mockBuildContext = MockBuildContext();
  });

  group('Example Services Login Test', () {
    testWidgets('Success', (tester) async {
      RequestExampleEntity requestExampleEntity =
          RequestExampleEntity(username: 'kminchelle', password: '0lelplR');

      when(() => loginRepository.exampleLogin(mockBuildContext,
              path: '/auth/login', requestExampleEntity: requestExampleEntity))
          .thenAnswer((_) => Future.value(
                ResponseExampleEntity(
                  token: 'token',
                ),
              ));

      var response = await loginRepository.exampleLogin(
        mockBuildContext,
        path: '/auth/login',
        requestExampleEntity: requestExampleEntity,
      );
      expect(response?.token, isNotEmpty);
    });

    testWidgets('Faild', (widgetTester) async {
      RequestExampleEntity requestExampleEntity =
          RequestExampleEntity(username: '', password: '');

      when(() => loginRepository.exampleLogin(mockBuildContext,
              path: '/auth/login', requestExampleEntity: requestExampleEntity))
          .thenAnswer((_) => Future.value(null));

      var response = await loginRepository.exampleLogin(
        mockBuildContext,
        path: '/auth/login',
        requestExampleEntity: requestExampleEntity,
      );
      expect(response?.token, isNull);
    });
  });
}
