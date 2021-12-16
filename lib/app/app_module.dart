import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'features/posts/presenter/posts_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => AppController(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: PostsModule(),
    ),
  ];
}
