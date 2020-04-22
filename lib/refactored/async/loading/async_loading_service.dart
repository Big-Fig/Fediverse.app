abstract class IAsyncLoadingService {
  Stream<bool> get isLoadingStream;

  bool get isLoading;
}
