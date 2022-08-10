import 'package:clean_archtecture/src/modules/domain/entities/comment.dart';

abstract class ICommentDatasource {
  Future<List> getComments();
}
