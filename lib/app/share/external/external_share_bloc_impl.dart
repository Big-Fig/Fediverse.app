import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';

abstract class ExternalShareBloc extends DisposableOwner
    implements IExternalShareBloc {
  final IExternalShareService externalShareService;

  ExternalShareBloc({
    required this.externalShareService,
  });
}
