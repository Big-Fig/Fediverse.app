import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_entity_settings_model.freezed.dart';

@freezed
class ShareEntitySettings with _$ShareEntitySettings {
  const factory ShareEntitySettings({
    required bool appendFromAccount,
    required bool withCreatedAt,
    required bool withMedia,
    required bool withText,
    required bool withLink,
    required bool wholeAsLink,
    required bool mediaAsLink,
    required String? withMessage,
  }) = _ShareEntitySettings;
}
