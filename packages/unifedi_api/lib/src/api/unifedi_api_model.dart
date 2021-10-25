import 'package:fediverse_api/fediverse_api.dart';
import 'package:mastodon_api/mastodon_api.dart';

abstract class IUnifediApiObject implements IFediverseApiObject {}

abstract class IUnifediApiResponsePart implements IFediverseApiResponsePart {}

abstract class IUnifediApiFilesRequest {}

abstract class IUnifediApiResponse implements IUnifediApiResponsePart {}

abstract class IUnifediApiUnion implements IMastodonApiUnion {}
