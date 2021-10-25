import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi_app/collapsible/owner/collapsible_owner_bloc.dart';
import 'package:fedi_app/collapsible/owner/collapsible_owner_bloc_impl.dart';
import 'package:flutter/cupertino.dart';

class CollapsibleOwnerWidget extends StatelessWidget {
  final Widget child;

  const CollapsibleOwnerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      DisposableProvider<ICollapsibleOwnerBloc>(
        create: CollapsibleOwnerBloc.createFromContext,
        child: Stack(
          children: <Widget>[
            child,
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ToggleCollapsibleOverlayWidget(),
              ),
            ),
          ],
        ),
      );
}
