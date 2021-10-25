import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'fediverse_push_toot_relay_message_model.dart';

part 'fediverse_push_toot_relay_message_model_impl.freezed.dart';

part 'fediverse_push_toot_relay_message_model_impl.g.dart';

// ignore_for_file: no-magic-number

@freezed
@HiveType(typeId: 0)
class FediversePushTootRelayMessage
    with _$FediversePushTootRelayMessage
    implements IFediversePushTootRelayMessage {
  const factory FediversePushTootRelayMessage({
    @HiveField(0) @JsonKey(name: 'crypto_key') required String cryptoKey,
    @HiveField(1) required String salt,
    @HiveField(2) required String payload,
    @HiveField(3) required String account,
    @HiveField(4) required String server,
  }) = _FediversePushTootRelayMessage;

  factory FediversePushTootRelayMessage.fromJson(Map<String, dynamic> json) =>
      _$FediversePushTootRelayMessageFromJson(json);
}
