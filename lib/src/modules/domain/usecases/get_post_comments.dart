import 'package:clean_archtecture/src/core/errors/errors.dart';
import 'package:clean_archtecture/src/modules/domain/entities/comment.dart';
import 'package:clean_archtecture/src/modules/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IGetComments {
  Future<Either<IPostException, List<Comment>>> call(String postId);
}

class GetPostComments implements IGetComments {
  final IPostRepository repository;
  GetPostComments(this.repository);
  @override
  Future<Either<IPostException, List<Comment>>> call(String postId) async {
    if (postId.isEmpty) {
      return left(ArgumentsException('PostId is empty'));
    }
    return repository.getPostComments(postId);
  }
}
