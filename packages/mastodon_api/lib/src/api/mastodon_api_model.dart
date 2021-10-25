import 'package:fediverse_api/fediverse_api.dart';

abstract class IMastodonApiObject implements IFediverseApiObject {}

abstract class IMastodonApiResponsePart
    implements IFediverseApiResponsePart, IMastodonApiObject {}

abstract class IMastodonApiResponse implements IMastodonApiResponsePart {}

abstract class IMastodonApiUnion implements IFediverseApiUnion {}
