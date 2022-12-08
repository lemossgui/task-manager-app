abstract class ListRepository<T> {
  Future<List<T>> findAll();
}
