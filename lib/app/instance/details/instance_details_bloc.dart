import 'package:fedi/app/hashtag/hashtag_url_helper.dart';
import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';

import 'package:unifedi_api/unifedi_api.dart';
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

  Future<IUnifediApiInstance> refresh();
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

  String? get version => instance?.versionString;

  Stream<String?> get versionStream =>
      instanceStream.map((instance) => instance?.versionString);

  UnifediApiInstanceType get instanceType => instance!.typeAsUnifediApi;

  Stream<UnifediApiInstanceType> get instanceTypeStream =>
      instanceStream.map((instance) => instance!.typeAsUnifediApi);

  IUnifediApiInstanceUrls? get urls => instance?.urls;

  Stream<IUnifediApiInstanceUrls?> get urlsStream =>
      instanceStream.map((instance) => instance?.urls);

  IUnifediApiInstanceStats? get stats => instance?.stats;

  Stream<IUnifediApiInstanceStats?> get statsStream =>
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
    var maxTootChars = instance?.limits?.status?.maxTootChars;

    return maxTootChars != null ? int.parse(maxTootChars.toString()) : null;
  }

  Stream<int?> get maxTootCharsStream => instanceStream.map((instance) {
        var maxTootChars = instance?.limits?.status?.maxTootChars;

        return maxTootChars != null ? int.parse(maxTootChars.toString()) : null;
      });

  IUnifediApiInstancePollLimits? get pollLimits => instance?.limits?.poll;

  Stream<IUnifediApiInstancePollLimits?> get pollLimitsStream =>
      instanceStream.map((instance) => instance?.limits?.poll);

  int? get uploadLimit => instance?.limits?.media?.uploadLimit;

  Stream<int?> get uploadLimitStream =>
      instanceStream.map((instance) => instance?.limits?.media?.uploadLimit);

  int? get avatarUploadLimit => instance?.limits?.media?.avatarUploadLimit;

  Stream<int?> get avatarUploadLimitStream =>
      instanceStream.map((instance) => instance?.limits?.media?.avatarUploadLimit);

  int? get backgroundUploadLimit => instance?.limits?.media?.backgroundUploadLimit;

  Stream<int?> get backgroundUploadLimitStream =>
      instanceStream.map((instance) => instance?.limits?.media?.backgroundUploadLimit);

  int? get bannerUploadLimit => instance?.limits?.media?.bannerUploadLimit;

  Stream<int?> get bannerUploadLimitStream =>
      instanceStream.map((instance) => instance?.limits?.media?.backgroundUploadLimit);

  int? get descriptionLimit => instance?.limits?.media?.descriptionLimit;

  Stream<int?> get descriptionLimitStream =>
      instanceStream.map((instance) => instance?.limits?.media?.descriptionLimit);

  int? get chatLimit => instance?.limits?.chat?.messageLimit;

  Stream<int?> get chatLimitStream =>
      instanceStream.map((instance) => instance?.limits?.chat?.messageLimit);

  List<String>? get pleromaMetadataFeatures =>
      instance?.features;

  Stream<List<String>?> get pleromaMetadataFeaturesStream =>
      instanceStream.map((instance) => instance?.features);

  IUnifediApiInstanceFederation?
      get unifediApiInstanceFederation => instance?.federation;

  Stream<IUnifediApiInstanceFederation?>
      get unifediApiInstanceFederationStream => instanceStream
          .map((instance) => instance?.federation);

  List<String>? get pleromaMetadataPostFormats =>
      instance?.postFormats;

  Stream<List<String>?> get pleromaMetadataPostFormatsStream => instanceStream
      .map((instance) => instance?.postFormats);

  bool? get pleromaMetadataAccountActivationRequired =>
      instance?.accountActivationRequired;

  Stream<bool?> get pleromaMetadataAccountActivationRequiredStream =>
      instanceStream.map(
        (instance) => instance?.accountActivationRequired,
      );

  IUnifediApiInstanceFieldLimits?
      get pleromaMetadataFieldsLimits =>
          instance?.limits?.field;

  Stream<IUnifediApiInstanceFieldLimits?>
      get pleromaMetadataFieldsLimitsStream => instanceStream
          .map((instance) => instance?.limits?.field);

  String? get vapidPublicKey => instance?.vapidPublicKey;

  Stream<String?> get vapidPublicKeyStream =>
      instanceStream.map((instance) => instance?.vapidPublicKey);

  String? get backgroundImage => instance?.backgroundImage;

  Stream<String?> get backgroundImageStream =>
      instanceStream.map((instance) => instance?.backgroundImage);

  IUnifediApiAccount? get contactAccount => instance?.contactAccount;

  Stream<IUnifediApiAccount?> get contactAccountStream =>
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
  IUnifediApiInstance? instance,
) {
  var descriptionOrShortDescription = _calculateDescriptionOrShortDescription(
    instance,
  );

  if (descriptionOrShortDescription?.isNotEmpty == true) {
    var allMatches = _hashtagRegex.allMatches(descriptionOrShortDescription!);

    var resultDescriptionOrShortDescription = descriptionOrShortDescription;

    // remove duplicated
    var hashtags = allMatches.map((match) => match.group(0)!).toSet();

    var isMastodon = instance!.typeAsUnifediApi.isMastodon;
    var isPleroma = instance.typeAsUnifediApi.isPleroma;

    var host = instance.uri;
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
  IUnifediApiInstance? instance,
) =>
    instance?.description?.isNotEmpty == true
        ? instance!.description
        : instance!.shortDescription;

bool _calculateIsHaveDetailsFields(IUnifediApiInstance? instance) =>
    instance?.email != null ||
    instance?.versionString != null ||
    instance?.languages != null ||
    instance?.vapidPublicKey != null;

bool _calculateIsHaveRegistrationsFields(IUnifediApiInstance? instance) =>
    instance?.registrations != null ||
    instance?.approvalRequired != null ||
    instance?.invitesEnabled != null;

bool _calculateIsHaveStatsFields(IUnifediApiInstance? instance) =>
    instance?.stats?.domainCount != null ||
    instance?.stats?.statusCount != null ||
    instance?.stats?.userCount != null;

bool _calculateIsHaveUploadLimitsFields(IUnifediApiInstance? instance) =>
    instance?.limits?.media?.uploadLimit != null ||
        instance?.limits?.media?.avatarUploadLimit != null ||
        instance?.limits?.media?.bannerUploadLimit != null ||
        instance?.limits?.media?.backgroundUploadLimit != null;

bool _calculateIsHaveMessagesLimitsFields(IUnifediApiInstance? instance) =>
    instance?.limits?.status?.maxTootChars != null ||
    instance?.limits?.chat?.messageLimit != null ||
    instance?.limits?.media?.descriptionLimit != null;

bool _calculateIsHavePollLimitsFields(IUnifediApiInstance? instance) =>
    instance?.limits?.poll?.maxOptions != null ||
    instance?.limits?.poll?.maxOptionChars != null ||
    instance?.limits?.poll?.maxExpiration != null ||
    instance?.limits?.poll?.minExpiration != null;

bool _calculateIsHaveFieldsLimitsFields(IUnifediApiInstance? instance) =>
    instance?.limits?.field?.valueLength != null ||
    instance?.limits?.field?.nameLength != null ||
    instance?.limits?.field?.maxRemoteFields != null ||
    instance?.limits?.field?.maxFields != null;

bool _calculateIsHaveMetadataFields(IUnifediApiInstance? instance) =>
    instance?.features?.isNotEmpty == true ||
    instance?.postFormats?.isNotEmpty == true;

// ignore: code-metrics
bool _calculateIsHaveFederationFields(IUnifediApiInstance? instance) =>
    instance?.federation?.enabled != null ||
    instance?.federation?.exclusions != null ||
    instance?.federation?.mrfObjectAge != null ||
    instance?.federation?.mrfPolicies != null ||
    instance?.federation?.quarantinedInstances != null;
