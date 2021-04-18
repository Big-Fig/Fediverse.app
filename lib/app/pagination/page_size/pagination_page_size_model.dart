// ignore_for_file: no-magic-number
enum PaginationPageSize {
  size5,
  size10,
  size20,
  size50,
  size100,
}

const defaultPaginationPageSize = PaginationPageSize.size50;

const _size5PaginationPageSizeJsonValue = "size5";
const _size10PaginationPageSizeJsonValue = "size10";
const _size20PaginationPageSizeJsonValue = "size20";
const _size50PaginationPageSizeJsonValue = "size50";
const _size100PaginationPageSizeJsonValue = "size100";

extension PaginationPageSizeExtension on PaginationPageSize {
  String toJsonValue() {
    String result;

    switch (this) {
      case PaginationPageSize.size5:
        result = _size5PaginationPageSizeJsonValue;
        break;
      case PaginationPageSize.size10:
        result = _size10PaginationPageSizeJsonValue;
        break;
      case PaginationPageSize.size20:
        result = _size20PaginationPageSizeJsonValue;
        break;
      case PaginationPageSize.size50:
        result = _size50PaginationPageSizeJsonValue;
        break;
      case PaginationPageSize.size100:
        result = _size100PaginationPageSizeJsonValue;
        break;
    }

    return result;
  }

  int toCount() {
    int count;

    switch (this) {
      case PaginationPageSize.size5:
        count = 5;
        break;
      case PaginationPageSize.size10:
        count = 10;
        break;
      case PaginationPageSize.size20:
        count = 20;
        break;
      case PaginationPageSize.size50:
        count = 50;
        break;
      case PaginationPageSize.size100:
        count = 100;
        break;
    }

    return count;
  }
}

extension PaginationPageSizeStringExtension on String {
  PaginationPageSize toPaginationPageSize() {
    PaginationPageSize result;

    switch (this) {
      case _size5PaginationPageSizeJsonValue:
        result = PaginationPageSize.size5;
        break;
      case _size10PaginationPageSizeJsonValue:
        result = PaginationPageSize.size10;
        break;
      case _size20PaginationPageSizeJsonValue:
        result = PaginationPageSize.size20;
        break;
      case _size50PaginationPageSizeJsonValue:
        result = PaginationPageSize.size50;
        break;
      case _size100PaginationPageSizeJsonValue:
        result = PaginationPageSize.size100;
        break;
      // can't parse, default value
      default:
        result = defaultPaginationPageSize;
        break;
    }

    return result;
  }
}
