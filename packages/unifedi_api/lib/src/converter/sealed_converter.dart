abstract class SealedConverter<T, K> {
  T convertFrom(K item);

  K convertTo(T item);
}
