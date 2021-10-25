import 'package:fedi_app/app/filter/create/create_filter_page.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';

class FilterListCreateButtonWidget extends StatelessWidget {
  const FilterListCreateButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paginationListBloc = IPaginationListBloc.of(context);

    return FediPrimaryFilledTextButtonWithBorder(
      S.of(context).app_filter_list_action_add,
      expanded: false,
      onPressed: () {
        goToCreateFilterPage(
          context: context,
          onSubmit: (_) {
            paginationListBloc.refreshWithController();
          },
        );
      },
    );
  }
}
