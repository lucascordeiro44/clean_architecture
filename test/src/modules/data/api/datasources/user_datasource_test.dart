import 'dart:convert';

import 'package:clean_archtecture/src/modules/data/api/datasources/user_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';

import '../../../../mocks/mocks.dart';

class MockUno extends Mock implements Uno {}

void main() {
  final MockUno mockUno = MockUno();
  test('Test UserDatasource', () async {
    UserDatasource datasource = UserDatasource(mockUno);
    when(() => mockUno.get(any())).thenAnswer((_) async => Response(
        request: Request(
            uri: Uri.parse('uri'),
            method: 'get',
            headers: {},
            timeout: const Duration(seconds: 3)),
        headers: {},
        status: 200,
        data: jsonDecode(userJson)));
    final result = await datasource.getUsers();
  });
}
