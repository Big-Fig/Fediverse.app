extension StreamExtension<T> on Stream<T?> {
  Stream<T> mapToNotNull() => map((event) => event!);
}