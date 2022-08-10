import 'dart:convert';
import 'package:clean_archtecture/src/core/errors/errors.dart';
import 'package:clean_archtecture/src/modules/data/datasources/post_datasource.dart';
import 'package:uno/uno.dart';

class PostDatasource implements IPostDatasource {
  final Uno uno;

  PostDatasource(this.uno);

  @override
  Future<List> getPosts() async {
    try {
      final response = await uno
          .get('https://run.mocky.io/v3/f436458d-6908-4b31-b3d8-0cc6ffa9603a');
      final list = response.data;
      return list;
    } on DataSoucePostException catch (e, s) {
      throw DataSoucePostException(e.toString(), stackTrace: s);
    }
  }
}
