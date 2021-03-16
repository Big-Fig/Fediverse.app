import 'package:fedi/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountDomainBlockListItemWidget extends StatelessWidget {
  final DomainBlockCallback? domainBlockSelectedCallback;
  final List<Widget>? domainBlockActions;

  MyAccountDomainBlockListItemWidget({
    required this.domainBlockSelectedCallback,
    this.domainBlockActions,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (domainBlockSelectedCallback != null) {
          var domain = Provider.of<DomainBlock>(
            context,
            listen: false,
          );
          domainBlockSelectedCallback!(context, domain);
        }
      },
      child: Padding(
        padding: FediPadding.allBigPadding,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Expanded(
              child: _MyAccountDomainBlockListItemBodyWidget(),
            ),
            if (domainBlockActions?.isNotEmpty == true) ...domainBlockActions!
          ],
        ),
      ),
    );
  }
}

class _MyAccountDomainBlockListItemBodyWidget extends StatelessWidget {
  const _MyAccountDomainBlockListItemBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var domain = Provider.of<DomainBlock>(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          domain.domain,
          style: IFediUiTextTheme.of(context).mediumShortBoldDarkGrey,
        )
      ],
    );
  }
}
