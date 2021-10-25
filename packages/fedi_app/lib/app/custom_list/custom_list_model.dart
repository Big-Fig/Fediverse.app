import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_list_model.freezed.dart';

abstract class ICustomList {
  String get remoteId;

  String get title;
}

@freezed
class CustomList with _$CustomList implements ICustomList {
  const factory CustomList({
    required String remoteId,
    required String title,
  }) = _CustomList;
}
