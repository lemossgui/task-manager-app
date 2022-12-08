import 'package:task_manager/task_manager.dart';

class CategoryInjector extends Injector {
  @override
  void dependencies() {
    put<CategoryStore>(
      CategoryRemoteImpl(),
    );

    put<CategoryRepository>(
      CategoryRepositoryImpl(
        remote: find(),
      ),
    );

    lazyPut(
      () => CategoryListBloC(
        repository: find(),
      ),
    );

    lazyPut(
      () => CategoryFormBloC(
        repository: find(),
      ),
    );
  }
}
