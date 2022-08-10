import 'dart:convert';

import 'package:clean_archtecture/src/core/errors/errors.dart';
import 'package:clean_archtecture/src/modules/data/datasources/comment_datasource.dart';
import 'package:uno/uno.dart';

class CommentDatasource implements ICommentDatasource {
  final Uno uno;

  CommentDatasource(this.uno);

  @override
  Future<List> getComments() async {
    try {
      final response = await uno
          .get('https://run.mocky.io/v3/83079673-f70b-4775-bdfa-d5cfd9c53a7e');
      final list = response.data;
      return list;
    } on DataSoucePostException catch (e, s) {
      throw DataSoucePostException(e.toString(), stackTrace: s);
    }
  }
}
