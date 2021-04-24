import 'package:fedi/mastodon/api/status/context/mastodon_api_status_context_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_status_context_model.g.dart';

abstract class IPleromaApiStatusContext implements IMastodonApiStatusContext {
  @override
  List<IPleromaApiStatus> get descendants;

  @override
  List<IPleromaApiStatus> get ancestors;
}

@JsonSerializable()
class PleromaApiStatusContext implements IPleromaApiStatusContext {
  @override
  final List<PleromaApiStatus> descendants;
  @override
  final List<PleromaApiStatus> ancestors;

  PleromaApiStatusContext({
    required this.descendants,
    required this.ancestors,
  });

  static PleromaApiStatusContext fromJson(Map<String, dynamic> json) =>
      _$PleromaApiStatusContextFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiStatusContextToJson(this);

  @override
  String toString() {
    return 'PleromaApiStatusContext{'
        'descendants: $descendants, '
        'ancestors: $ancestors'
        '}';
  }
}
