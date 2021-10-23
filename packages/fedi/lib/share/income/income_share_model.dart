import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_share_model.freezed.dart';

@freezed
class IncomeShareEvent with _$IncomeShareEvent {
  const factory IncomeShareEvent({
    required String? text,
    required List<IncomeShareEventMedia>? medias,
  }) = _IncomeShareEvent;
}

@freezed
class IncomeShareEventMedia with _$IncomeShareEventMedia {
  const factory IncomeShareEventMedia({
    required String path,
    required String? thumbnail,
    required int? duration,
    required IncomeShareEventMediaType type,
  }) = _IncomeShareEventMedia;
}

enum IncomeShareEventMediaType { image, video, file }
