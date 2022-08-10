import 'package:clean_archtecture/src/modules/data/api/datasources/comment_datasosurce.dart';
import 'package:clean_archtecture/src/modules/data/api/datasources/post_datasource.dart';
import 'package:clean_archtecture/src/modules/data/api/datasources/user_datasource.dart';
import 'package:clean_archtecture/src/modules/data/datasources/comment_datasource.dart';
import 'package:clean_archtecture/src/modules/data/datasources/post_datasource.dart';
import 'package:clean_archtecture/src/modules/data/datasources/user_datasource.dart';
import 'package:clean_archtecture/src/modules/data/repositories/post_repository.dart';
import 'package:clean_archtecture/src/modules/domain/repositories/post_repository.dart';
import 'package:clean_archtecture/src/modules/domain/usecases/get_post_comments.dart';
import 'package:clean_archtecture/src/modules/domain/usecases/get_posts_usecase.dart';
import 'package:clean_archtecture/src/modules/presenter/pages/post_page.dart';
import 'package:clean_archtecture/src/modules/presenter/stores/post_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

// injeçao de dependencia para unir todas as dependencias das camadas.
class PostModule extends Module {
  List<Bind> get binds => [
        //Utils
        Bind.factory((i) => Uno()),
        //datasource
        Bind.factory<IPostDatasource>((i) => PostDatasource(i())),
        Bind.factory<IUserDatasource>((i) => UserDatasource(i())),
        Bind.factory<ICommentDatasource>((i) => CommentDatasource(i())),
        //repository
        Bind.factory<IPostRepository>((i) => PostRepository(i(), i(), i())),
        //usecases
        Bind.factory((i) => GetPosts(i())),
        Bind.factory((i) => GetPostComments(i())),
        //stores
        Bind.singleton((i) => PostStore(i()))
        //Quando vc usa o singleton vc recupera do sistema de depencendia
        //apenas umas instancia que será a mesma.
        //se vc pegar em oustros lugares ele vai resetar e vai pegar a mesma instancia
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const PostPage()),
      ];
}
