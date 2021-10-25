import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/status/body/status_body_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class StatusBodyBloc extends DisposableOwner implements IStatusBodyBloc {
  @override
  final bool collapsible;
  @override
  final IUnifediApiMediaAttachment? initialMediaAttachment;

  StatusBodyBloc({
    required this.collapsible,
    required this.initialMediaAttachment,
  });
}
