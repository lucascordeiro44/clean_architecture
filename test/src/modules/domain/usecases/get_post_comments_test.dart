import 'package:clean_archtecture/src/core/errors/errors.dart';
import 'package:clean_archtecture/src/modules/domain/entities/comment.dart';
import 'package:clean_archtecture/src/modules/domain/repositories/post_repository.dart';
import 'package:clean_archtecture/src/modules/domain/usecases/get_post_comments.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements IPostRepository {}

final mockPostRepository = MockPostRepository();

final comment = <Comment>[
  Comment(id: '0', text: 'comment', postId: '0'),
  Comment(id: '1', text: 'comment', postId: '0'),
  Comment(id: '3', text: 'comment', postId: '0')
];

void main() {
  group('Teste do GetPost usecase', () {
    test('Deve retornar a lista de comentarios', () async {
      //arrange
      when(() => mockPostRepository.getPostComments(any()))
          .thenAnswer((_) async => Right(comment));
      final usecase = GetPostComments(mockPostRepository);
      //act
      final result = await usecase.call('1');
      //assert
      expect(result, Right(comment));
    });

    test('Deve retornar um ArgumentException se o parametro for vazio',
        () async {
      final usecase = GetPostComments(mockPostRepository);
      //act
      final result = await usecase.call('');
      //assert
      expect(result.fold(id, id), isA<ArgumentsException>());
    });
  });
}
