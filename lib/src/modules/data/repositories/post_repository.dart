import 'package:clean_archtecture/src/core/errors/errors.dart';
import 'package:clean_archtecture/src/modules/data/adapter/comment_adapter.dart';
import 'package:clean_archtecture/src/modules/data/adapter/post_adapter.dart';
import 'package:clean_archtecture/src/modules/data/datasources/comment_datasource.dart';
import 'package:clean_archtecture/src/modules/data/datasources/post_datasource.dart';
import 'package:clean_archtecture/src/modules/data/datasources/user_datasource.dart';
import 'package:clean_archtecture/src/modules/domain/entities/post.dart';
import 'package:clean_archtecture/src/modules/domain/entities/comment.dart';
import 'package:clean_archtecture/src/modules/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepository extends IPostRepository {
  final IUserDatasource userDatasource;
  final IPostDatasource postDatasource;
  final ICommentDatasource commentDatasource;

  PostRepository(
      this.userDatasource, this.postDatasource, this.commentDatasource);

  @override
  Future<Either<IPostException, List<Comment>>> getPostComments(
      String postId) async {
    try {
      final list = await commentDatasource.getComments();
      final List<Comment> comments = list
          .where((e) => e['postId'] == postId)
          .map((e) => CommentAdapter.fromJson(e))
          .toList();
      return right(comments);
    } on IPostException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IPostException, List<Post>>> getPosts() async {
    try {
      final listUsers = await userDatasource.getUsers();
      final listComments = await commentDatasource.getComments();
      final listPosts = await postDatasource.getPosts();
      final map = <String, int>{};

      for (var comment in listComments) {
        if (!map.containsKey(comment['postId'])) {
          map[comment['postId']] = 1;
        } else {
          map[comment['postId']] = map[comment['postId']]! + 1;
        }
      }

      listUsers.forEach((user) {
        for (dynamic post in listPosts) {
          if (user['id'] == post['userId']) {
            post['user'] = user;
          }
          post['totalComments'] = map[post['id']] ?? 0;
        }
      });
      final List<Post> posts =
          listPosts.map((e) => PostAdapter.fromJson(e)).toList();
      return right(posts);
    } on IPostException catch (e) {
      print(e.toString());
      return left(e);
    }
  }
}
