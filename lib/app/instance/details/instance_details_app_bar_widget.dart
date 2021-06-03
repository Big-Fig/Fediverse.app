import 'package:fedi/app/instance/details/instance_details_bloc.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class InstanceDetailsPageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const InstanceDetailsPageAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return FediPageTitleAppBar(
      title: S.of(context).app_instance_detials_title(
            instanceDetailsBloc.instanceUriDomain,
          ),
    );
  }

  @override
  Size get preferredSize => FediPageTitleAppBar.calculatePreferredSize();
}
