import 'package:fedi/refactored/collapsible/collapsible_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToggleCollapsibleOverlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var collapsibleBloc = ICollapsibleBloc.of(context, listen: true);

    return StreamBuilder<bool>(
        stream: collapsibleBloc.isAtLeastOneVisibleItemExpandedStream,
        initialData: collapsibleBloc.isAtLeastOneVisibleItemExpanded,
        builder: (context, snapshot) {
          var isAtLeastOneVisibleItemExpanded = snapshot.data;

          if (isAtLeastOneVisibleItemExpanded) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: collapsibleBloc.collapseAllVisibleItems,
                color: Colors.white,
                icon: Icon(Icons.keyboard_arrow_up),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
