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
          .get('https://run.mocky.io/v3/63492f7f-1fdc-41a4-88dd-1deb1195d465');
      final list = response.data;
      return list;
    } on DataSoucePostException catch (e, s) {
      throw DataSoucePostException(e.toString(), stackTrace: s);
    }
  }
}
