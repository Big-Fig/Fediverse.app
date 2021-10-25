import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../../api/account/relationship/unifedi_api_account_relationship_model.dart';

part 'unifedi_api_account_relationship_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_account_relationship_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccountRelationshipMastodonAdapter
    with _$UnifediApiAccountRelationshipMastodonAdapter
    implements IUnifediApiAccountRelationship {
  const UnifediApiAccountRelationshipMastodonAdapter._();
  const factory UnifediApiAccountRelationshipMastodonAdapter(
    @HiveField(0) MastodonApiAccountRelationship value,
  ) = _UnifediApiAccountRelationshipMastodonAdapter;

  @override
  bool? get blockedBy => value.blockedBy;

  @override
  bool? get blocking => value.blocking;

  @override
  bool? get domainBlocking => value.domainBlocking;

  @override
  bool? get endorsed => value.endorsed;

  @override
  bool? get followedBy => value.followedBy;

  @override
  bool? get following => value.following;

  @override
  String? get id => value.id;

  @override
  bool? get muting => value.muting;

  @override
  bool? get mutingNotifications => value.mutingNotifications;

  @override
  String? get note => value.note;

  @override
  bool? get notifying => value.notifying;

  @override
  bool? get requested => value.requested;

  @override
  bool? get showingReblogs => value.showingReblogs;

  @override
  bool? get subscribing => null;
  factory UnifediApiAccountRelationshipMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccountRelationshipMastodonAdapterFromJson(json);
}

extension MastodonApiAccountRelationshipUnifediExtension
    on IMastodonApiAccountRelationship {
  UnifediApiAccountRelationshipMastodonAdapter
      toUnifediApiAccountRelationshipMastodonAdapter() =>
          UnifediApiAccountRelationshipMastodonAdapter(
            toMastodonApiAccountRelationship(),
          );
}

extension MastodonApiAccountRelationshipUnifediListExtension
    on List<IMastodonApiAccountRelationship> {
  List<UnifediApiAccountRelationshipMastodonAdapter>
      toUnifediApiAccountRelationshipMastodonAdapterList() => map(
            (item) => item.toUnifediApiAccountRelationshipMastodonAdapter(),
          ).toList();
}
