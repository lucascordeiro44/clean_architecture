//Adapter vc transforma algo em outra
import 'package:clean_archtecture/src/modules/domain/entities/comment.dart';
import 'package:flutter/material.dart';

class CommentAdapter {
  static Comment fromJson(dynamic data) {
    return Comment(text: data['text'], postId: data['postId'], id: data['id']);
  }
}
