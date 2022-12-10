import 'package:task_manager/task_manager.dart';

class CategoryInjector extends Injector {
  @override
  void dependencies() {
    put<CategoryStore>(
      CategoryRemoteImpl(),
      tag: 'remote',
    );

    put<CategoryStore>(
      CategoryLocalImpl(),
      tag: 'local',
    );

    put<CategoryRepository>(
      CategoryRepositoryImpl(
        remote: find(tag: 'remote'),
        local: find(tag: 'local'),
      ),
    );

    lazyPut(
      () => CategoryListBloC(
        repository: find(),
      ),
      fenix: true,
    );

    lazyPut(
      () => CategoryFormBloC(
        repository: find(),
      ),
      fenix: true,
    );
  }
}
