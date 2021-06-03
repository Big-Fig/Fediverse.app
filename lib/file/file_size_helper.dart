class FileSizeHelper {
  static const bytesInMb = 1024;
  static const kbInMb = 1024;

  static double convertBytesToMegaBytes(int bytes) =>
      bytes / bytesInMb / kbInMb;
}
