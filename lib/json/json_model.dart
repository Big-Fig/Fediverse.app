import 'package:base_fediverse_api/base_fediverse_api.dart'
    as base_fediverse_api;

abstract class IJsonObject implements base_fediverse_api.IJsonObject {
  @override
  Map<String, dynamic> toJson();
}
