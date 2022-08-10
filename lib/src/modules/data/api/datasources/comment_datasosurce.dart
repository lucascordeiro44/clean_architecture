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
          .get('https://run.mocky.io/v3/15e19e4a-f6e6-43fd-a7c7-513f6b844550');
      final list = response.data;
      return list;
    } on DataSoucePostException catch (e, s) {
      throw DataSoucePostException(e.toString(), stackTrace: s);
    }
  }
}
