import 'package:clean_archtecture/src/modules/domain/entities/user.dart';

class UserAdapter {
  static User fromJson(dynamic data) {
    return User(
        id: data['id'],
        userName: data['name'],
        userPhoto: data['avatar']['url']);
  }
}
