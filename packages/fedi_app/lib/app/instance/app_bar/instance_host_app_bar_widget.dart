import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/instance/instance_bloc.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class InstanceHostAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget leading;
  const InstanceHostAppBarWidget({
    Key? key,
    this.leading = const FediBackIconButton(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceBloc = IInstanceBloc.of(context);

    var instanceUri = instanceBloc.instanceUri;

    var configService = IConfigService.of(context);

    var urlOnInstanceForDisplay = configService.processUrlOnInstanceForDisplay(
      urlOnInstance: instanceUri.toString(),
    );

    var instanceUriDomain = Uri.parse(urlOnInstanceForDisplay).host;

    return FediPageTitleAppBar(
      title: S.of(context).app_instance_details_title(
            instanceUriDomain,
          ),
      leading: leading,
    );
  }

  @override
  Size get preferredSize => FediPageTitleAppBar.calculatePreferredSize();
}
