import 'package:clean_archtecture/src/core/errors/errors.dart';
import 'package:clean_archtecture/src/modules/domain/entities/post.dart';
import 'package:clean_archtecture/src/modules/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

//Usecase é a Execução da regra de negócio
abstract class IGetPosts {
  Future<Either<IPostException, List<Post>>> call();
}

class GetPosts implements IGetPosts {
  final IPostRepository repository;
  GetPosts(this.repository);
  @override
  Future<Either<IPostException, List<Post>>> call() async {
    return await repository.getPosts();
  }
}
