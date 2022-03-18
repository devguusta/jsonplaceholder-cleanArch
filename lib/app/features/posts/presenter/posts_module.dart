import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_clean/app/features/posts/data/datasource/datasource.dart';
import 'package:json_clean/app/features/posts/data/repositories/posts_repository_implementation.dart';
import 'package:json_clean/app/features/posts/domain/usecases/usecases.dart';
import 'package:json_clean/app/features/posts/presenter/pages/posts_bloc.dart';
import 'package:json_clean/app/features/posts/presenter/pages/posts_page.dart';

import '../../../app_controller.dart';

class PostsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => PostsDataSourceImplementation(
            httpClient: i.get<AppController>().dio)),
        Bind.lazySingleton(
          (i) => PostsRepositoryImplementation(
            dataSource: i.get<PostsDataSourceImplementation>(),
          ),
        ),
        Bind.lazySingleton(
          (i) => GetAllPosts(
            repository: PostsRepositoryImplementation(
              dataSource: i.get<PostsDataSourceImplementation>(),
            ),
          ),
        ),
        Bind.lazySingleton(
          (i) => PostsCubits(
            i.get<GetAllPosts>(),
          ),
        ),
        Bind.lazySingleton(
          (i) => PostsBloc(
            i.get<GetAllPosts>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, args) => const PostsPage(),
        ),
      ];
}
