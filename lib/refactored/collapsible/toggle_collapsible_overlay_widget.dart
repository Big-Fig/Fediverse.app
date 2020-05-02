import 'package:fedi/refactored/collapsible/collapsible_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToggleCollapsibleOverlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var collapsibleBloc = ICollapsibleBloc.of(context, listen: true);

    return StreamBuilder<bool>(
        stream: collapsibleBloc.isCurrentVisibleItemPossibleToCollapseStream,
        initialData: collapsibleBloc.isCurrentVisibleItemPossibleToCollapse,
        builder: (context, snapshot) {
          var isCurrentVisibleItemCollapsible = snapshot.data;

          if (isCurrentVisibleItemCollapsible == true) {
            return StreamBuilder<bool>(
                stream: collapsibleBloc.isCurrentVisibleItemCollapsedStream,
                initialData: collapsibleBloc.isCurrentVisibleItemCollapsed,
                builder: (context, snapshot) {
                  var isCurrentVisibleItemCollapsed = snapshot.data;
                  var icon = isCurrentVisibleItemCollapsed == true
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up;
                  return Container(
                    decoration: new BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: collapsibleBloc.toggleCollapse,
                      color: Colors.white,
                      icon: Icon(icon),
                    ),
                  );
                });
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
