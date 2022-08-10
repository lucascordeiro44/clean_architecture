//Repository is the class that will implements and linking the usecase with the external data
import 'package:clean_archtecture/src/core/errors/errors.dart';
import 'package:clean_archtecture/src/modules/domain/entities/comment.dart';
import 'package:clean_archtecture/src/modules/domain/entities/post.dart';
import 'package:clean_archtecture/src/modules/domain/usecases/get_post_comments.dart';
import 'package:dartz/dartz.dart';

abstract class IPostRepository {
  Future<Either<IPostException, List<Post>>> getPosts();
  Future<Either<IPostException, List<Comment>>> getPostComments(String postId);
}
