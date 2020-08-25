import 'package:fedi/collapsible/collapsible_bloc.dart';
import 'package:fedi/collapsible/collapsible_bloc_impl.dart';
import 'package:fedi/app/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';

class CollapsibleOwnerWidget extends StatelessWidget {
  final Widget child;

  CollapsibleOwnerWidget({@required this.child});

  @override
  Widget build(BuildContext context) => DisposableProvider<ICollapsibleBloc>(
        create: (context) => CollapsibleBloc.createFromContext(context),
        child: Stack(
          children: <Widget>[
            child,
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ToggleCollapsibleOverlayWidget(),
              ),
            )
          ],
        ),
      );
}
