import 'package:fedi_app/app/pagination/cached/cached_pagination_list_with_new_items_merge_overlay_button.dart';
import 'package:flutter/cupertino.dart';

const _tapToLoadTopPadding = 24.0;

class FediListTapToLoadOverlayWidget extends StatelessWidget {
  final String Function(BuildContext context, int updateItemsCount) textBuilder;

  const FediListTapToLoadOverlayWidget({
    Key? key,
    required this.textBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: _tapToLoadTopPadding),
          child: CachedPaginationListWithNewItemsMergeOverlayButton(
            textBuilder: textBuilder,
          ),
        ),
      );
}
