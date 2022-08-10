import 'package:clean_archtecture/src/modules/data/adapter/user_adapter.dart';
import 'package:clean_archtecture/src/modules/domain/entities/post.dart';

//Padrão do mapper e do adapter são metodos estaticos
class PostAdapter {
  static Post fromJson(dynamic data) {
    return Post(
        id: data['id'],
        text: data['text'],
        totalComments: data['totalComments'],
        user: UserAdapter.fromJson(data['user']));
  }
}
