import 'dart:convert';

import 'package:clean_archtecture/src/core/errors/errors.dart';
import 'package:clean_archtecture/src/modules/data/datasources/user_datasource.dart';
import 'package:uno/uno.dart';

class UserDatasource implements IUserDatasource {
  final Uno uno;

  UserDatasource(this.uno);

  @override
  Future<List> getUsers() async {
    try {
      final response = await uno
          .get('https://run.mocky.io/v3/fef6367b-65ac-491e-a2d2-2633eeb0c9e1');
      final list = response.data;
      return list;
    } on DataSoucePostException catch (e, s) {
      throw DataSoucePostException(e.toString(), stackTrace: s);
    }
  }
}
