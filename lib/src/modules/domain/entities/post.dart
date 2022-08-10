//The entity doesn't have nothing business logic, for example she hasn't fromMap and toMap
import 'package:clean_archtecture/src/modules/domain/entities/user.dart';

class Post {
  final String id;
  final User user;
  final int totalComments;
  final String text;

  Post(
      {required this.id,
      required this.user,
      required this.totalComments,
      required this.text});
}
