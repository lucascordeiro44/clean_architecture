import 'package:clean_archtecture/src/modules/domain/usecases/get_posts_usecase.dart';
import 'package:clean_archtecture/src/modules/presenter/states/post_state.dart';
import 'package:flutter/material.dart';

class PostStore extends ValueNotifier<PostState> {
  final IGetPosts usecase;
  PostStore(this.usecase) : super(EmptyPostState([]));

  void emit(PostState newState) => value = newState;

  Future<void> fetchPosts() async {
    emit(LoadingPostState());
    final result = await usecase.call();
    final newState = result.fold((l) {
      return ErrorPostState(l.message);
    }, (r) {
      return SuccessPostState(r);
    });
    emit(newState);
  }
}
