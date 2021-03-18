import 'package:fedi/app/custom_list/custom_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/custom_list_page.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListListItemWidget extends StatelessWidget {
  const CustomListListItemWidget();

  @override
  Widget build(BuildContext context) {
    var customListBloc = ICustomListBloc.of(context);
    return InkWell(
      onTap: () {
        goToCustomListPage(
          context: context,
          customList: customListBloc.customList!,
          onChanged: (ICustomList? customList) {
            _refresh(context);
          },
          onDeleted: () {
            _refresh(context);
          },
        );
      },
      child: Padding(
        padding: FediPadding.allBigPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const _CustomListListItemTitleWidget(),
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

class _CustomListListItemTitleWidget extends StatelessWidget {
  const _CustomListListItemTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customListBloc = ICustomListBloc.of(context);
    return StreamBuilder<String?>(
      stream: customListBloc.titleStream,
      initialData: customListBloc.title,
      builder: (context, snapshot) {
        var title = snapshot.data!;
        return Text(
          title,
          textAlign: TextAlign.left,
          style: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
        );
      },
    );
  }
}
