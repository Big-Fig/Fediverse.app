// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';

import '../../../mastodon/api/instance/mastodon_api_instance_test_helper.dart';
import '../account/pleroma_api_account_test_helper.dart';

class PleromaApiInstanceTestHelper {
  static PleromaApiInstanceHistory createTestPleromaApiInstanceHistory({
    required String seed,
  }) =>
      PleromaApiInstanceHistory(
        logins: seed + "logins",
        registrations: seed + "registrations",
        statuses: seed + "statuses",
        week: seed + "week",
      );

  static PleromaApiInstancePleromaPart createTestPleromaApiInstancePleromaPart({
    required String seed,
  }) =>
      PleromaApiInstancePleromaPart(
        metadata: createTestPleromaApiInstancePleromaPartMetadata(
          seed: seed,
        ),
      );

  static PleromaApiInstancePleromaPartMetadata
      createTestPleromaApiInstancePleromaPartMetadata({
    required String seed,
  }) =>
          PleromaApiInstancePleromaPartMetadata(
            features: [
              seed + 'feature1',
              seed + 'feature2',
            ],
            federation:
                createTestPleromaApiInstancePleromaPartMetadataFederation(
              seed: seed,
            ),
            postFormats: [
              seed + 'postFormat1',
              seed + 'postFormat2',
            ],
            accountActivationRequired: seed.hashCode % 2 == 0,
            fieldsLimits:
                createTestPleromaApiInstancePleromaPartMetadataFieldLimits(
              seed: seed,
            ),
          );

  static PleromaApiInstancePleromaPartMetadataFieldLimits
      createTestPleromaApiInstancePleromaPartMetadataFieldLimits({
    required String seed,
  }) =>
          PleromaApiInstancePleromaPartMetadataFieldLimits(
            maxFields: seed.hashCode + 1,
            maxRemoteFields: seed.hashCode + 2,
            nameLength: seed.hashCode + 3,
            valueLength: seed.hashCode + 4,
          );

  static PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge
      createTestPleromaApiInstancePleromaPartMetadataFederationMfrObjectAge({
    required String seed,
  }) =>
          PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge(
            threshold: seed.hashCode + 1,
            actions: [
              seed + 'action1',
              seed + 'action2',
            ],
          );

  static PleromaApiInstancePleromaPartMetadataFederation
      createTestPleromaApiInstancePleromaPartMetadataFederation({
    required String seed,
  }) =>
          PleromaApiInstancePleromaPartMetadataFederation(
            enabled: seed.hashCode % 2 == 0,
            exclusions: seed.hashCode % 2 == 1,
            mrfObjectAge:
                createTestPleromaApiInstancePleromaPartMetadataFederationMfrObjectAge(
              seed: seed,
            ),
            mrfPolicies: [
              seed + 'policy1',
              seed + 'policy2',
            ],
            quarantinedInstances: [
              seed + 'quarantinedInstance1',
              seed + 'quarantinedInstance2',
            ],
          );

  static PleromaApiInstancePollLimits createTestPleromaApiInstancePollLimits({
    required String seed,
  }) =>
      PleromaApiInstancePollLimits(
        maxExpiration: seed.hashCode + 1,
        maxOptionChars: seed.hashCode + 2,
        maxOptions: seed.hashCode + 3,
        minExpiration: seed.hashCode + 4,
      );

  static PleromaApiInstance createTestPleromaApiInstance({
    required String seed,
    bool? approvalRequired,
  }) {
    return PleromaApiInstance(
      approvalRequired: approvalRequired ?? seed.hashCode % 2 == 0,
      avatarUploadLimit: seed.hashCode + 1,
      backgroundUploadLimit: seed.hashCode + 2,
      bannerUploadLimit: seed.hashCode + 3,
      contactAccount:
          PleromaApiAccountTestHelper.createTestPleromaApiAccount(seed: seed),
      email: seed + "email",
      languages: [
        seed + "lang1",
        seed + "lang2",
      ],
      maxTootChars: seed.hashCode + 4,
      pleroma: createTestPleromaApiInstancePleromaPart(seed: seed),
      pollLimits: createTestPleromaApiInstancePollLimits(
        seed: seed,
      ),
      registrations: seed.hashCode % 2 == 1,
      shortDescription: seed + "shortDescription",
      stats: MastodonApiInstanceTestHelper.createTestMastodonApiInstanceStats(
          seed: seed),
      thumbnail: seed + "thumbnail",
      title: seed + "title",
      uploadLimit: seed.hashCode + 7,
      uri: seed + "uri",
      urls: MastodonApiInstanceTestHelper.createTestMastodonApiUrls(
        seed: seed,
      ),
      vapidPublicKey: seed + "vapidPublicKey",
      version: seed + "version",
      backgroundImage: seed + "backgroundImage",
      chatLimit: seed.hashCode + 5,
      description: seed + "description",
      descriptionLimit: seed.hashCode + 6,
      invitesEnabled: seed.hashCode % 2 == 0,
    );
  }
}
