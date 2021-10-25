import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/share/external/external_share_bloc.dart';
import 'package:fedi_app/app/share/external/external_share_service.dart';

abstract class ExternalShareBloc extends DisposableOwner
    implements IExternalShareBloc {
  final IExternalShareService externalShareService;

  ExternalShareBloc({
    required this.externalShareService,
  });
}
