import 'dart:convert';
import 'package:clean_archtecture/src/modules/data/datasources/comment_datasource.dart';
import 'package:clean_archtecture/src/modules/data/datasources/post_datasource.dart';
import 'package:clean_archtecture/src/modules/data/datasources/user_datasource.dart';
import 'package:clean_archtecture/src/modules/data/repositories/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart' as dartz;

import '../../../mocks/mocks.dart';

class MockUserDatasource extends Mock implements IUserDatasource {}

class MockPostDatasurce extends Mock implements IPostDatasource {}

class MockCommentDatasource extends Mock implements ICommentDatasource {}

void main() {
  final IUserDatasource userDatasource = MockUserDatasource();
  final IPostDatasource postDatasource = MockPostDatasurce();
  final ICommentDatasource commentDatasource = MockCommentDatasource();

  final repository =
      PostRepository(userDatasource, postDatasource, commentDatasource);
  test('Teste do get comentários PostRepository ', () async {
    when(() => commentDatasource.getComments())
        .thenAnswer((_) async => jsonDecode(commentJson));
    final result = await repository.getPostComments('0');
    final list = result.fold((l) => throw Exception(l.message), (r) => r);
  });

  test('Teste do get post do PostRepository ', () async {
    when(() => postDatasource.getPosts())
        .thenAnswer((_) async => jsonDecode(postJson));
    when(() => commentDatasource.getComments())
        .thenAnswer((_) async => jsonDecode(commentJson));
    when(() => userDatasource.getUsers())
        .thenAnswer((_) async => jsonDecode(userJson));
    final result = await repository.getPosts();
  });
}
