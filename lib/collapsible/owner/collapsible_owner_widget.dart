import 'package:fedi/app/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_bloc.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_bloc_impl.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:flutter/cupertino.dart';

class CollapsibleOwnerWidget extends StatelessWidget {
  final Widget child;

  const CollapsibleOwnerWidget({required this.child});

  @override
  Widget build(BuildContext context) =>
      DisposableProvider<ICollapsibleOwnerBloc>(
        create: (context) => CollapsibleOwnerBloc.createFromContext(context),
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
