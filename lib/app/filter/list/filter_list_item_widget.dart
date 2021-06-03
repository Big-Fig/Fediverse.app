import 'package:fedi/app/filter/edit/edit_filter_page.dart';
import 'package:fedi/app/filter/filter_bloc.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
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

    return InkWell(
      onTap: () {
        goToEditFilterPage(
          context: context,
          filter: filterBloc.filter,
          onSubmit: (IFilter filter) {
            _refresh(context);
          },
          onDelete: () async {
            await IFilterRepository.of(context, listen: false).deleteById(
              filterBloc.filter.localId!,
              batchTransaction: null,
            );
            _refresh(context);
          },
        );
      },
      child: Padding(
        padding: FediPadding.allBigPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _FilterListItemPhraseWidget(),
            const _FilterListItemExpiredWidget(),
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

class _FilterListItemExpiredWidget extends StatelessWidget {
  const _FilterListItemExpiredWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filterBloc = IFilterBloc.of(context);

    return StreamBuilder<bool>(
      stream: filterBloc.isExpiredStream,
      initialData: filterBloc.isExpired,
      builder: (context, snapshot) {
        var isExpired = snapshot.data!;
        if (isExpired) {
          return Text(
            S.of(context).app_filter_expired,
            style: IFediUiTextTheme.of(context).bigTallError,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _FilterListItemPhraseWidget extends StatelessWidget {
  const _FilterListItemPhraseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filterBloc = IFilterBloc.of(context);

    _logger.finest(() => "build ${filterBloc.remoteId}");
    var fediUiTextTheme = IFediUiTextTheme.of(context);

    return Text(
      filterBloc.filter.phrase,
      style: fediUiTextTheme.bigTallBoldDarkGrey,
    );
  }
}
