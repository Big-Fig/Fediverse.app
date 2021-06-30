import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:easy_dispose/easy_dispose.dart';

abstract class ExternalShareBloc extends DisposableOwner
    implements IExternalShareBloc {
  final IExternalShareService externalShareService;

  ExternalShareBloc({
    required this.externalShareService,
  });
}
