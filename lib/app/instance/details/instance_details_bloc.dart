import 'package:fedi/app/hashtag/hashtag_url_helper.dart';
import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class IInstanceDetailsBloc
    implements IInstanceBloc, IAsyncInitLoadingBloc, IInstanceLocationBloc {
  static IInstanceDetailsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceDetailsBloc>(context, listen: listen);

  RefreshController get refreshController;

  Future<IPleromaApiInstance> refresh();
}

extension IInstanceDetailsBlocExtension on IInstanceDetailsBloc {
  String get instanceUriDomain => instanceUri.host;

  String? get title => instance?.title;

  Stream<String?> get titleStream =>
      instanceStream.map((instance) => instance?.title);

  String? get shortDescription => instance?.shortDescription;

  Stream<String?> get shortDescriptionStream =>
      instanceStream.map((instance) => instance?.shortDescription);

  String? get description => instance?.description;

  Stream<String?> get descriptionStream =>
      instanceStream.map((instance) => instance?.description);

  String? get descriptionOrShortDescription =>
      _calculateDescriptionOrShortDescription(
        instance,
      );

  Stream<String?> get descriptionOrShortDescriptionStream => instanceStream.map(
        (instance) => _calculateDescriptionOrShortDescription(
          instance,
        ),
      );

  String? get descriptionOrShortDescriptionWithParsedHashtags =>
      _calculateDescriptionOrShortDescriptionWithParsedHashtags(
        instance,
      );

  Stream<String?> get descriptionOrShortDescriptionWithParsedHashtagsStream =>
      instanceStream.map(
        (instance) => _calculateDescriptionOrShortDescriptionWithParsedHashtags(
          instance,
        ),
      );

  String? get email => instance?.email;

  Stream<String?> get emailStream =>
      instanceStream.map((instance) => instance?.email);

  String? get version => instance?.version;

  Stream<String?> get versionStream =>
      instanceStream.map((instance) => instance?.version);

  PleromaApiInstanceVersionType? get versionType => instance?.versionType;

  Stream<PleromaApiInstanceVersionType?> get versionTypeStream =>
      instanceStream.map((instance) => instance?.versionType);

  MastodonApiUrls? get urls => instance?.urls;

  Stream<MastodonApiUrls?> get urlsStream =>
      instanceStream.map((instance) => instance?.urls);

  MastodonApiInstanceStats? get stats => instance?.stats;

  Stream<MastodonApiInstanceStats?> get statsStream =>
      instanceStream.map((instance) => instance?.stats);

  String? get thumbnail => instance?.thumbnail;

  Stream<String?> get thumbnailStream =>
      instanceStream.map((instance) => instance?.thumbnail);

  List<String>? get languages => instance?.languages;

  Stream<List<String>?> get languagesStream =>
      instanceStream.map((instance) => instance?.languages);

  bool? get registrations => instance?.registrations;

  Stream<bool?> get registrationsStream =>
      instanceStream.map((instance) => instance?.registrations);

  bool? get approvalRequired => instance?.approvalRequired;

  Stream<bool?> get approvalRequiredStream =>
      instanceStream.map((instance) => instance?.approvalRequired);

  bool? get invitesEnabled => instance?.invitesEnabled;

  Stream<bool?> get invitesEnabledStream =>
      instanceStream.map((instance) => instance?.invitesEnabled);

  int? get maxTootChars {
    var maxTootChars = instance?.maxTootChars;

    return maxTootChars != null ? int.parse(maxTootChars.toString()) : null;
  }

  Stream<int?> get maxTootCharsStream => instanceStream.map((instance) {
        var maxTootChars = instance?.maxTootChars;

        return maxTootChars != null ? int.parse(maxTootChars.toString()) : null;
      });

  PleromaApiInstancePollLimits? get pollLimits => instance?.pollLimits;

  Stream<PleromaApiInstancePollLimits?> get pollLimitsStream =>
      instanceStream.map((instance) => instance?.pollLimits);

  int? get uploadLimit => instance?.uploadLimit;

  Stream<int?> get uploadLimitStream =>
      instanceStream.map((instance) => instance?.uploadLimit);

  int? get avatarUploadLimit => instance?.avatarUploadLimit;

  Stream<int?> get avatarUploadLimitStream =>
      instanceStream.map((instance) => instance?.avatarUploadLimit);

  int? get backgroundUploadLimit => instance?.backgroundUploadLimit;

  Stream<int?> get backgroundUploadLimitStream =>
      instanceStream.map((instance) => instance?.backgroundUploadLimit);

  int? get bannerUploadLimit => instance?.bannerUploadLimit;

  Stream<int?> get bannerUploadLimitStream =>
      instanceStream.map((instance) => instance?.bannerUploadLimit);

  int? get descriptionLimit => instance?.descriptionLimit;

  Stream<int?> get descriptionLimitStream =>
      instanceStream.map((instance) => instance?.descriptionLimit);

  int? get chatLimit => instance?.chatLimit;

  Stream<int?> get chatLimitStream =>
      instanceStream.map((instance) => instance?.chatLimit);

  PleromaApiInstancePleromaPart? get pleroma => instance?.pleroma;

  Stream<PleromaApiInstancePleromaPart?> get pleromaStream =>
      instanceStream.map((instance) => instance?.pleroma);

  PleromaApiInstancePleromaPartMetadata? get pleromaMetadata =>
      instance?.pleroma?.metadata;

  Stream<PleromaApiInstancePleromaPartMetadata?> get pleromaMetadataStream =>
      instanceStream.map((instance) => instance?.pleroma?.metadata);

  List<String>? get pleromaMetadataFeatures =>
      instance?.pleroma?.metadata?.features;

  Stream<List<String>?> get pleromaMetadataFeaturesStream =>
      instanceStream.map((instance) => instance?.pleroma?.metadata?.features);

  PleromaApiInstancePleromaPartMetadataFederation?
      get pleromaMetadataFederation => instance?.pleroma?.metadata?.federation;

  Stream<PleromaApiInstancePleromaPartMetadataFederation?>
      get pleromaMetadataFederationStream => instanceStream
          .map((instance) => instance?.pleroma?.metadata?.federation);

  List<String>? get pleromaMetadataPostFormats =>
      instance?.pleroma?.metadata?.postFormats;

  Stream<List<String>?> get pleromaMetadataPostFormatsStream => instanceStream
      .map((instance) => instance?.pleroma?.metadata?.postFormats);

  bool? get pleromaMetadataAccountActivationRequired =>
      instance?.pleroma?.metadata?.accountActivationRequired;

  Stream<bool?> get pleromaMetadataAccountActivationRequiredStream =>
      instanceStream.map(
        (instance) => instance?.pleroma?.metadata?.accountActivationRequired,
      );

  PleromaApiInstancePleromaPartMetadataFieldLimits?
      get pleromaMetadataFieldsLimits =>
          instance?.pleroma?.metadata?.fieldsLimits;

  Stream<PleromaApiInstancePleromaPartMetadataFieldLimits?>
      get pleromaMetadataFieldsLimitsStream => instanceStream
          .map((instance) => instance?.pleroma?.metadata?.fieldsLimits);

  String? get vapidPublicKey => instance?.vapidPublicKey;

  Stream<String?> get vapidPublicKeyStream =>
      instanceStream.map((instance) => instance?.vapidPublicKey);

  String? get backgroundImage => instance?.backgroundImage;

  Stream<String?> get backgroundImageStream =>
      instanceStream.map((instance) => instance?.backgroundImage);

  IPleromaApiAccount? get contactAccount => instance?.contactAccount;

  Stream<IPleromaApiAccount?> get contactAccountStream =>
      instanceStream.map((instance) => instance?.contactAccount);

  bool get isHaveDetailsFields => _calculateIsHaveDetailsFields(instance);

  Stream<bool> get isHaveDetailsFieldsStream => instanceStream.map(
        (instance) => _calculateIsHaveDetailsFields(instance),
      );

  bool get isHaveRegistrationsFields =>
      _calculateIsHaveRegistrationsFields(instance);

  Stream<bool> get isHaveRegistrationsFieldsStream => instanceStream.map(
        (instance) => _calculateIsHaveRegistrationsFields(instance),
      );

  bool get isHaveStatsFields => _calculateIsHaveRegistrationsFields(instance);

  Stream<bool> get isHaveStatsFieldsStream => instanceStream.map(
        (instance) => _calculateIsHaveStatsFields(instance),
      );

  bool get isHaveUploadLimitsFields =>
      _calculateIsHaveUploadLimitsFields(instance);

  Stream<bool> get isHaveUploadLimitsFieldsStream => instanceStream.map(
        (instance) => _calculateIsHaveUploadLimitsFields(instance),
      );

  bool get isHaveMessagesLimitsFields =>
      _calculateIsHaveMessagesLimitsFields(instance);

  Stream<bool> get isHaveMessagesLimitsFieldsStream => instanceStream.map(
        (instance) => _calculateIsHaveMessagesLimitsFields(instance),
      );

  bool get isHavePollLimitsFields => _calculateIsHavePollLimitsFields(instance);

  Stream<bool> get isHavePollLimitsFieldsStream => instanceStream.map(
        (instance) => _calculateIsHavePollLimitsFields(instance),
      );

  bool get isHaveFieldsLimitsFields =>
      _calculateIsHaveFieldsLimitsFields(instance);

  Stream<bool> get isHaveFieldsLimitsFieldsStream => instanceStream.map(
        (instance) => _calculateIsHaveFieldsLimitsFields(instance),
      );

  bool get isHaveMetadataFields => _calculateIsHaveMetadataFields(instance);

  Stream<bool> get isHaveMetadataFieldsStream => instanceStream.map(
        (instance) => _calculateIsHaveMetadataFields(instance),
      );

  bool get isHaveFederationFields => _calculateIsHaveFederationFields(instance);

  Stream<bool> get isHaveFederationFieldsStream => instanceStream.map(
        (instance) => _calculateIsHaveFederationFields(instance),
      );
}

final _hashtagRegex = RegExp(r'#\w+');

String? _calculateDescriptionOrShortDescriptionWithParsedHashtags(
  IPleromaApiInstance? instance,
) {
  var descriptionOrShortDescription = _calculateDescriptionOrShortDescription(
    instance,
  );

  if (descriptionOrShortDescription?.isNotEmpty == true) {
    var allMatches = _hashtagRegex.allMatches(descriptionOrShortDescription!);

    var resultDescriptionOrShortDescription = descriptionOrShortDescription;

    // remove duplicated
    var hashtags = allMatches.map((match) => match.group(0)!).toSet();

    var isMastodon = instance!.isMastodon;
    var isPleroma = instance.isPleroma;

    var host = instance.uri!;
    // todo: check
    var scheme = 'https';
    hashtags.forEach(
      (hashtag) {
        var hashtagWithoutSign = hashtag.replaceAll('#', '');
        var link = HashtagUrlHelper.calculateHashtagUrl(
          isMastodon: isMastodon,
          isPleroma: isPleroma,
          urlSchema: scheme,
          urlHost: host,
          hashtag: hashtagWithoutSign,
        );

        // don't replace if text already htmlized
        if (!resultDescriptionOrShortDescription.contains(link)) {
          var replace = '<a href="$link">$hashtag</a>';
          resultDescriptionOrShortDescription =
              resultDescriptionOrShortDescription.replaceAll(
            hashtag,
            replace,
          );
        }
      },
    );

    return resultDescriptionOrShortDescription;
  } else {
    return descriptionOrShortDescription;
  }
}

String? _calculateDescriptionOrShortDescription(
  IPleromaApiInstance? instance,
) =>
    instance?.description?.isNotEmpty == true
        ? instance!.description
        : instance!.shortDescription;

bool _calculateIsHaveDetailsFields(IPleromaApiInstance? instance) =>
    instance?.email != null ||
    instance?.version != null ||
    instance?.languages != null ||
    instance?.vapidPublicKey != null;

bool _calculateIsHaveRegistrationsFields(IPleromaApiInstance? instance) =>
    instance?.registrations != null ||
    instance?.approvalRequired != null ||
    instance?.invitesEnabled != null;

bool _calculateIsHaveStatsFields(IPleromaApiInstance? instance) =>
    instance?.stats?.domainCount != null ||
    instance?.stats?.statusCount != null ||
    instance?.stats?.userCount != null;

bool _calculateIsHaveUploadLimitsFields(IPleromaApiInstance? instance) =>
    instance?.uploadLimit != null ||
    instance?.avatarUploadLimit != null ||
    instance?.bannerUploadLimit != null ||
    instance?.backgroundUploadLimit != null;

bool _calculateIsHaveMessagesLimitsFields(IPleromaApiInstance? instance) =>
    instance?.maxTootChars != null ||
    instance?.chatLimit != null ||
    instance?.descriptionLimit != null;

bool _calculateIsHavePollLimitsFields(IPleromaApiInstance? instance) =>
    instance?.pollLimits?.maxOptions != null ||
    instance?.pollLimits?.maxOptionChars != null ||
    instance?.pollLimits?.maxExpiration != null ||
    instance?.pollLimits?.minExpiration != null;

bool _calculateIsHaveFieldsLimitsFields(IPleromaApiInstance? instance) =>
    instance?.pleroma?.metadata?.fieldsLimits?.valueLength != null ||
    instance?.pleroma?.metadata?.fieldsLimits?.nameLength != null ||
    instance?.pleroma?.metadata?.fieldsLimits?.maxRemoteFields != null ||
    instance?.pleroma?.metadata?.fieldsLimits?.maxFields != null;

bool _calculateIsHaveMetadataFields(IPleromaApiInstance? instance) =>
    instance?.pleroma?.metadata?.features?.isNotEmpty == true ||
    instance?.pleroma?.metadata?.postFormats?.isNotEmpty == true;

// ignore: code-metrics
bool _calculateIsHaveFederationFields(IPleromaApiInstance? instance) =>
    instance?.pleroma?.metadata?.federation?.enabled != null ||
    instance?.pleroma?.metadata?.federation?.exclusions != null ||
    instance?.pleroma?.metadata?.federation?.mrfObjectAge != null ||
    instance?.pleroma?.metadata?.federation?.mrfPolicies != null ||
    instance?.pleroma?.metadata?.federation?.quarantinedInstances != null;
