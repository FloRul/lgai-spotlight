import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  var dio = Dio(
    BaseOptions(
      baseUrl: const String.fromEnvironment('API_URL'),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      persistentConnection: false,
    ),
  );
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final authSession = await Amplify.Auth.fetchAuthSession() as CognitoAuthSession;
        options.headers.addAll(
          {
            'Authorization': authSession.userPoolTokensResult.value.idToken.raw,
            'Access-Control-Allow-Origin': '*',
          },
        );
        return handler.next(options);
      },
    ),
  );
  return dio;
}
