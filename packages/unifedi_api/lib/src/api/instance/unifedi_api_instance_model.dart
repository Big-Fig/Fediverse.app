import 'package:fediverse_api/fediverse_api.dart';

import '../../../unifedi_api.dart';
import '../account/unifedi_api_account_model.dart';
import 'federation/unifedi_api_instance_federation_model.dart';
import 'limits/unifedi_api_instance_limits_model.dart';
import 'stats/unifedi_api_instance_stats_model.dart';
import 'type/unifedi_api_instance_type_model.dart';
import 'urls/unifedi_api_instance_urls_model.dart';

abstract class IUnifediApiInstance implements IFediverseApiInstance {
  String get type;

  IUnifediApiInstanceLimits? get limits;

  String? get vapidPublicKey;

  String? get backgroundImage;

  IUnifediApiAccount? get contactAccount;

  List<String>? get features;

  List<String>? get postFormats;

  bool? get approvalRequired;

  bool? get accountActivationRequired;

  IUnifediApiInstanceFederation? get federation;

  IUnifediApiInstanceUrls? get urls;

  IUnifediApiInstanceStats? get stats;

  String? get title;

  String? get shortDescription;

  String? get description;

  String? get email;

  String? get thumbnail;

  List<String>? get languages;

  bool? get registrations;

  bool? get invitesEnabled;
}

extension UnifediApiInstanceExtension on IUnifediApiInstance {
  UnifediApiInstanceType get typeAsUnifediApi =>
      UnifediApiInstanceType.fromStringValue(
        type,
      );
}
