import 'package:fedi/app/account/select/recent/recent_select_account_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';

class RecentShareSelectAccountWidget extends StatelessWidget {
  final List<Widget> itemActions;
  final bool? alwaysShowHeader;
  final Widget? header;
  final bool? alwaysShowFooter;
  final Widget? footer;

  const RecentShareSelectAccountWidget({
    Key? key,
    required this.itemActions,
    this.header,
    this.footer,
    this.alwaysShowHeader,
    this.alwaysShowFooter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RecentSelectAccountWidget(
        itemActions: itemActions,
        itemPadding: FediPadding.allMediumPadding,
        header: header,
        footer: footer,
        alwaysShowHeader: alwaysShowHeader,
        alwaysShowFooter: alwaysShowFooter,
      );
}
