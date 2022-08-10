import 'package:clean_archtecture/src/modules/presenter/states/post_state.dart';
import 'package:clean_archtecture/src/modules/presenter/stores/post_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostStore>().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    final store = context.watch<PostStore>();
    final state = store.value;
    if (state is SuccessPostState) {
      return ListView.builder(
          itemCount: state.posts.length,
          itemBuilder: (context, index) {
            final post = state.posts[index];
            return ListTile(
              trailing: CircleAvatar(
                backgroundImage: NetworkImage(post.user.userPhoto),
              ),
              title: Text(post.user.userName),
              subtitle: Text(post.text),
            );
          });
    }
    if (state is LoadingPostState) {
      return const CircularProgressIndicator();
    }
    if (state is ErrorPostState) {
      return Container(
        color: Colors.white,
        child: Text(state.message),
      );
    }
  }
}
