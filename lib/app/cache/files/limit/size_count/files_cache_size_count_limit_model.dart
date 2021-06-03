// ignore_for_file: no-magic-number
enum FilesCacheSizeLimitCountType {
  notSet,
  size50,
  size100,
  size200,
  size500,
  size1000,
  size10000,
}

const defaultFilesCacheSizeLimitCountType = FilesCacheSizeLimitCountType.notSet;

const _notSetFilesCacheSizeLimitCountType = "notSet";
const _size50FilesCacheSizeLimitCountType = "size50";
const _size100FilesCacheSizeLimitCountType = "size100";
const _size200FilesCacheSizeLimitCountType = "size200";
const _size500FilesCacheSizeLimitCountType = "size500";
const _size1000FilesCacheSizeLimitCountType = "size1000";
const _size10000FilesCacheSizeLimitCountType = "size10000";

extension FilesCacheSizeLimitCountTypeExtension
    on FilesCacheSizeLimitCountType {
  String toJsonValue() {
    String result;

    switch (this) {
      case FilesCacheSizeLimitCountType.notSet:
        result = _notSetFilesCacheSizeLimitCountType;
        break;
      case FilesCacheSizeLimitCountType.size50:
        result = _size50FilesCacheSizeLimitCountType;
        break;
      case FilesCacheSizeLimitCountType.size100:
        result = _size100FilesCacheSizeLimitCountType;
        break;
      case FilesCacheSizeLimitCountType.size200:
        result = _size200FilesCacheSizeLimitCountType;
        break;
      case FilesCacheSizeLimitCountType.size500:
        result = _size500FilesCacheSizeLimitCountType;
        break;
      case FilesCacheSizeLimitCountType.size1000:
        result = _size1000FilesCacheSizeLimitCountType;
        break;
      case FilesCacheSizeLimitCountType.size10000:
        result = _size10000FilesCacheSizeLimitCountType;
        break;
    }

    return result;
  }

  int? toCountOrNull() {
    int? count;

    switch (this) {
      case FilesCacheSizeLimitCountType.notSet:
        count = null;
        break;
      case FilesCacheSizeLimitCountType.size50:
        count = 50;
        break;
      case FilesCacheSizeLimitCountType.size100:
        count = 100;
        break;
      case FilesCacheSizeLimitCountType.size200:
        count = 200;
        break;
      case FilesCacheSizeLimitCountType.size500:
        count = 500;
        break;
      case FilesCacheSizeLimitCountType.size1000:
        count = 1000;
        break;
      case FilesCacheSizeLimitCountType.size10000:
        count = 10000;
        break;
    }

    return count;
  }
}

extension FilesCacheSizeLimitCountTypeStringExtension on String {
  FilesCacheSizeLimitCountType toFilesCacheSizeLimitCountType() {
    FilesCacheSizeLimitCountType result;

    switch (this) {
      case _notSetFilesCacheSizeLimitCountType:
        result = FilesCacheSizeLimitCountType.notSet;
        break;
      case _size50FilesCacheSizeLimitCountType:
        result = FilesCacheSizeLimitCountType.size50;
        break;
      case _size100FilesCacheSizeLimitCountType:
        result = FilesCacheSizeLimitCountType.size100;
        break;
      case _size200FilesCacheSizeLimitCountType:
        result = FilesCacheSizeLimitCountType.size200;
        break;
      case _size500FilesCacheSizeLimitCountType:
        result = FilesCacheSizeLimitCountType.size500;
        break;
      case _size1000FilesCacheSizeLimitCountType:
        result = FilesCacheSizeLimitCountType.size1000;
        break;
      case _size10000FilesCacheSizeLimitCountType:
        result = FilesCacheSizeLimitCountType.size10000;
        break;
      // can't parse, default value
      default:
        result = defaultFilesCacheSizeLimitCountType;
        break;
    }

    return result;
  }
}
