import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/mastodon/instance/mastodon_instance_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class IInstanceDetailsBloc
    implements IDisposable, IAsyncInitLoadingBloc, IInstanceLocationBloc {
  static IInstanceDetailsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IInstanceDetailsBloc>(context, listen: listen);

  RefreshController get refreshController;

  bool get isPleroma;

  Uri get instanceUri;

  IPleromaInstance get instance;

  Stream<IPleromaInstance> get instanceStream;

  Future<IPleromaInstance> refresh();
}

extension IInstanceDetailsBlocExtension on IInstanceDetailsBloc {
  String get instanceUriDomain => instanceUri?.host;

  String get title => instance?.title;

  Stream<String> get titleStream =>
      instanceStream.map((instance) => instance?.title);

  String get shortDescription => instance?.shortDescription;

  Stream<String> get shortDescriptionStream =>
      instanceStream.map((instance) => instance?.shortDescription);

  String get description => instance?.description;

  Stream<String> get descriptionStream =>
      instanceStream.map((instance) => instance?.description);

  String get descriptionOrShortDescription =>
      instance?.description?.isNotEmpty == true
          ? instance?.description
          : instance?.shortDescription;

  Stream<String> get descriptionOrShortDescriptionStream =>
      instanceStream.map((instance) => instance?.description?.isNotEmpty == true
          ? instance.description
          : instance.shortDescription);

  String get email => instance?.email;

  Stream<String> get emailStream =>
      instanceStream.map((instance) => instance?.email);

  String get version => instance?.version;

  Stream<String> get versionStream =>
      instanceStream.map((instance) => instance?.version);

  PleromaInstanceVersionType get versionType => instance?.versionType;

  Stream<PleromaInstanceVersionType> get versionTypeStream =>
      instanceStream.map((instance) => instance?.versionType);

  MastodonUrls get urls => instance?.urls;

  Stream<MastodonUrls> get urlsStream =>
      instanceStream.map((instance) => instance?.urls);

  MastodonInstanceStats get stats => instance?.stats;

  Stream<MastodonInstanceStats> get statsStream =>
      instanceStream.map((instance) => instance?.stats);

  String get thumbnail => instance?.thumbnail;

  Stream<String> get thumbnailStream =>
      instanceStream.map((instance) => instance?.thumbnail);

  List<String> get languages => instance?.languages;

  Stream<List<String>> get languagesStream =>
      instanceStream.map((instance) => instance?.languages);

  bool get registrations => instance?.registrations;

  Stream<bool> get registrationsStream =>
      instanceStream.map((instance) => instance?.registrations);

  bool get approvalRequired => instance?.approvalRequired;

  Stream<bool> get approvalRequiredStream =>
      instanceStream.map((instance) => instance?.approvalRequired);

  bool get invitesEnabled => instance?.invitesEnabled;

  Stream<bool> get invitesEnabledStream =>
      instanceStream.map((instance) => instance?.invitesEnabled);

  int get maxTootChars => instance?.maxTootChars;

  Stream<int> get maxTootCharsStream =>
      instanceStream.map((instance) => instance?.maxTootChars);

  PleromaInstancePollLimits get pollLimits => instance?.pollLimits;

  Stream<PleromaInstancePollLimits> get pollLimitsStream =>
      instanceStream.map((instance) => instance?.pollLimits);

  int get uploadLimit => instance?.uploadLimit;

  Stream<int> get uploadLimitStream =>
      instanceStream.map((instance) => instance?.uploadLimit);

  int get avatarUploadLimit => instance?.avatarUploadLimit;

  Stream<int> get avatarUploadLimitStream =>
      instanceStream.map((instance) => instance?.avatarUploadLimit);

  int get backgroundUploadLimit => instance?.backgroundUploadLimit;

  Stream<int> get backgroundUploadLimitStream =>
      instanceStream.map((instance) => instance?.backgroundUploadLimit);

  int get bannerUploadLimit => instance?.bannerUploadLimit;

  Stream<int> get bannerUploadLimitStream =>
      instanceStream.map((instance) => instance?.bannerUploadLimit);

  int get descriptionLimit => instance?.descriptionLimit;

  Stream<int> get descriptionLimitStream =>
      instanceStream.map((instance) => instance?.descriptionLimit);

  int get chatLimit => instance?.chatLimit;

  Stream<int> get chatLimitStream =>
      instanceStream.map((instance) => instance?.chatLimit);

  PleromaInstancePleromaPart get pleroma => instance?.pleroma;

  Stream<PleromaInstancePleromaPart> get pleromaStream =>
      instanceStream.map((instance) => instance?.pleroma);

  PleromaInstancePleromaPartMetadata get pleromaMetadata =>
      instance?.pleroma?.metadata;

  Stream<PleromaInstancePleromaPartMetadata> get pleromaMetadataStream =>
      instanceStream.map((instance) => instance?.pleroma?.metadata);

  List<String> get pleromaMetadataFeatures =>
      instance?.pleroma?.metadata?.features;

  Stream<List<String>> get pleromaMetadataFeaturesStream =>
      instanceStream.map((instance) => instance?.pleroma?.metadata?.features);

  PleromaInstancePleromaPartMetadataFederation get pleromaMetadataFederation =>
      instance?.pleroma?.metadata?.federation;

  Stream<PleromaInstancePleromaPartMetadataFederation>
      get pleromaMetadataFederationStream => instanceStream
          .map((instance) => instance?.pleroma?.metadata?.federation);

  List<String> get pleromaMetadataPostFormats =>
      instance?.pleroma?.metadata?.postFormats;

  Stream<List<String>> get pleromaMetadataPostFormatsStream => instanceStream
      .map((instance) => instance?.pleroma?.metadata?.postFormats);

  bool get pleromaMetadataAccountActivationRequired =>
      instance?.pleroma?.metadata?.accountActivationRequired;

  Stream<bool> get pleromaMetadataAccountActivationRequiredStream =>
      instanceStream.map(
          (instance) => instance?.pleroma?.metadata?.accountActivationRequired);

  PleromaInstancePleromaPartMetadataFieldLimits
      get pleromaMetadataFieldsLimits =>
          instance?.pleroma?.metadata?.fieldsLimits;

  Stream<PleromaInstancePleromaPartMetadataFieldLimits>
      get pleromaMetadataFieldsLimitsStream => instanceStream
          .map((instance) => instance?.pleroma?.metadata?.fieldsLimits);

  String get vapidPublicKey => instance?.vapidPublicKey;

  Stream<String> get vapidPublicKeyStream =>
      instanceStream.map((instance) => instance?.vapidPublicKey);

  String get backgroundImage => instance?.backgroundImage;

  Stream<String> get backgroundImageStream =>
      instanceStream.map((instance) => instance?.backgroundImage);

  IPleromaAccount get contactAccount => instance?.contactAccount;

  Stream<IPleromaAccount> get contactAccountStream =>
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

bool _calculateIsHaveDetailsFields(IPleromaInstance instance) =>
    instance?.email != null ||
    instance?.version != null ||
    instance?.languages != null ||
    instance?.vapidPublicKey != null;

bool _calculateIsHaveRegistrationsFields(IPleromaInstance instance) =>
    instance?.registrations != null ||
    instance?.approvalRequired != null ||
    instance?.invitesEnabled != null;

bool _calculateIsHaveStatsFields(IPleromaInstance instance) =>
    instance?.stats?.domainCount != null ||
    instance?.stats?.statusCount != null ||
    instance?.stats?.userCount != null;

bool _calculateIsHaveUploadLimitsFields(IPleromaInstance instance) =>
    instance?.uploadLimit != null ||
    instance?.avatarUploadLimit != null ||
    instance?.bannerUploadLimit != null ||
    instance?.backgroundUploadLimit != null;

bool _calculateIsHaveMessagesLimitsFields(IPleromaInstance instance) =>
    instance?.maxTootChars != null ||
    instance?.chatLimit != null ||
    instance?.descriptionLimit != null;

bool _calculateIsHavePollLimitsFields(IPleromaInstance instance) =>
    instance?.pollLimits?.maxOptions != null ||
    instance?.pollLimits?.maxOptionChars != null ||
    instance?.pollLimits?.maxExpiration != null ||
    instance?.pollLimits?.minExpiration != null;

bool _calculateIsHaveFieldsLimitsFields(IPleromaInstance instance) =>
    instance?.pleroma?.metadata?.fieldsLimits?.valueLength != null ||
    instance?.pleroma?.metadata?.fieldsLimits?.nameLength != null ||
    instance?.pleroma?.metadata?.fieldsLimits?.maxRemoteFields != null ||
    instance?.pleroma?.metadata?.fieldsLimits?.maxFields != null;

bool _calculateIsHaveMetadataFields(IPleromaInstance instance) =>
    instance?.pleroma?.metadata?.features?.isNotEmpty == true ||
    instance?.pleroma?.metadata?.postFormats?.isNotEmpty == true;

bool _calculateIsHaveFederationFields(IPleromaInstance instance) =>
    instance?.pleroma?.metadata?.federation?.enabled != null ||
    instance?.pleroma?.metadata?.federation?.exclusions != null ||
    instance?.pleroma?.metadata?.federation?.mrfObjectAge != null ||
    instance?.pleroma?.metadata?.federation?.mrfPolicies != null ||
    instance?.pleroma?.metadata?.federation?.quarantinedInstances != null;
