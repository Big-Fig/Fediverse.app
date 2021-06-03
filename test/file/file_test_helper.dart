import 'package:file/file.dart';
import 'package:file/memory.dart';

class FileTestHelper {
  static File createTestFile({required String seed}) {
    FileSystem fileSystem = MemoryFileSystem();

    return fileSystem.file(seed);
  }
}
