import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_clean/app/features/posts/presenter/pages/posts_bloc.dart';
import 'package:json_clean/app/features/posts/presenter/pages/posts_state.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PostsBloc, PostsState>(
          bloc: Modular.get<PostsBloc>(),
          builder: (context, state) {
            if (state is PostsStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostsStateSuccess) {
              return ListView.builder(
                  itemCount: state.listPost.length - 90,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.listPost[index].title),
                    );
                  });
            } else {
              return Center(
                  child: Column(
                children: [
                  Text("Não deu"),
                  ElevatedButton(
                      onPressed: () {
                        Modular.get<PostsBloc>().getPosts();
                      },
                      child: Text("Olá"))
                ],
              ));
            }
          }),
    );
  }
}
