import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../unifedi_api_instance_type_model.dart';
import 'unifedi_api_instance_type_detector_bloc.dart';

final _logger = Logger('unifedi_api_instance_type_detector_bloc_impl.dart');

class UnifediApiInstanceTypeDetectorBloc extends DisposableOwner
    implements IUnifediApiInstanceTypeDetectorBloc {
  @override
  // ignore: long-method
  Future<UnifediApiInstanceType> detectInstanceType({
    required String url,
  }) async {
    var httpRestService = HttpRestService(
      baseUri: Uri.parse(url),
      encoding: IRestService.defaultEncoding,
      computeImpl: null,
      customRestResponseErrorExceptionCreator: (restError) =>
          MastodonApiRestErrorException(
        mastodonError:
            MastodonApiRestService.convertRestErrorToMastodonError(restError),
      ),
    );

    var mastodonApiAccessBloc = MastodonApiAccessBloc(
      access: MastodonApiAccess(
        url: url,
        instance: null,
        applicationAccessToken: null,
        userAccessToken: null,
      ),
    );

    var mastodonApiRestService = MastodonApiRestService(
      accessBloc: mastodonApiAccessBloc,
      restService: httpRestService,
    );
    var mastodonApiInstancePublicAccessService =
        MastodonApiInstancePublicAccessService(
      restService: mastodonApiRestService,
    );

    // ignore: cascade_invocations
    mastodonApiInstancePublicAccessService.addDisposables([
      mastodonApiRestService,
      mastodonApiAccessBloc,
      httpRestService,
    ]);

    UnifediApiInstanceType result;

    try {
      var instance = await mastodonApiInstancePublicAccessService.getInstance();

      var versionString = instance.versionString;
      result = versionString.contains('Pleroma')
          ? UnifediApiInstanceType.pleromaValue
          : UnifediApiInstanceType.mastodonValue;
    } on Exception catch (e, stackTrace) {
      _logger.shout(
        () => 'failed to detect instance type',
        e,
        stackTrace,
      );
      result = const UnifediApiInstanceType.unknown(
        stringValue: null,
      );
    }

    return result;
  }
}
