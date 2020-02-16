abstract class IReadListRepository<Item> {
  Future<List<Item>> getAll();

  Stream<List<Item>> watchAll();
}

abstract class IWriteListRepository<Item> {
  Future clear();

  Future<int> insert(Item item);

  Future insertAll(Iterable<Item> items);
  Future upsertAll(Iterable<Item> items);
}

abstract class IReadIdListRepository<Item, Id>
    implements IReadListRepository<Item> {
  Future<Item> findById(Id id);


  Stream<Item> watchById(Id id);

  Future<bool> isExistWithId(Id id);
}

abstract class IWriteIdListRepository<Item, Id>
    implements IWriteListRepository<Item> {
  Future<bool> deleteById(Id id);
  Future<bool> updateById(Id id, Item item);
}
