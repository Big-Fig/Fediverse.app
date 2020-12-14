import 'package:fedi/app/filter/edit/edit_filter_page.dart';
import 'package:fedi/app/filter/filter_bloc.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("filter_list_item_widget.dart");

class FilterListItemWidget extends StatelessWidget {
  const FilterListItemWidget();

  @override
  Widget build(BuildContext context) {
    var filterBloc = IFilterBloc.of(context);

    _logger.finest(() => "build ${filterBloc.remoteId}");
    var fediUiTextTheme = IFediUiTextTheme.of(context);

    return InkWell(
      onTap: () {
        goToEditFilterPage(
          context: context,
          filter: filterBloc.filter,
          onSubmit: (IFilter filter) {
            _refresh(context);
          },
          onDelete: () async {
            await IFilterRepository.of(context, listen: false)
                .deleteById(filterBloc.filter.localId);
            _refresh(context);
          },
        );
      },
      child: Padding(
        padding: FediPadding.allBigPadding,
        child: Row(
          children: [
            Text(
              filterBloc.filter.phrase,
              style: fediUiTextTheme.bigTallBoldDarkGrey,
            )
          ],
        ),
      ),
    );
  }

  void _refresh(BuildContext context) {
    IPaginationListBloc.of(
      context,
      listen: false,
    ).refreshWithController();
  }
}
