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
          .get('https://run.mocky.io/v3/188a97b5-071d-4cae-937e-9061f0f8bba4');
      final list = response.data;
      return list;
    } on DataSoucePostException catch (e, s) {
      throw DataSoucePostException(e.toString(), stackTrace: s);
    }
  }
}
