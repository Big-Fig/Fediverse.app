import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/custom_list/custom_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_page.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
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
            context: context, customList: customListBloc.customList);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: FediPadding.allSmallPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const _CustomListListItemTitleWidget(),
                const _CustomListListItemActionsWidget()
              ],
            ),
          ),
          const FediLightGreyDivider()
        ],
      ),
    );
  }
}

class _CustomListListItemActionsWidget extends StatelessWidget {
  const _CustomListListItemActionsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          const _CustomListListItemActionsEditWidget(),
          const _CustomListListItemActionsDeleteWidget(),
        ],
      );
}

class _CustomListListItemActionsDeleteWidget extends StatelessWidget {
  const _CustomListListItemActionsDeleteWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customListBloc = ICustomListBloc.of(context);
    var paginationListBloc = IPaginationListBloc.of(context);
    return FediIconButton(
      icon: Icon(FediIcons.delete),
      onPressed: () {
        PleromaAsyncOperationHelper.performPleromaAsyncOperation(
          context: context,
          asyncCode: () async {
            await customListBloc.delete();

            paginationListBloc.refreshWithController();
          },
        );
      },
    );
  }
}

class _CustomListListItemActionsEditWidget extends StatelessWidget {
  const _CustomListListItemActionsEditWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customListBloc = ICustomListBloc.of(context);
    var paginationListBloc = IPaginationListBloc.of(context);
    return FediIconButton(
      icon: Icon(FediIcons.pen),
      onPressed: () {
        goToEditCustomListPage(
            context: context,
            customList: customListBloc.customList,
            successCallback: () {
              paginationListBloc.refreshWithController();
            });
      },
    );
  }
}

class _CustomListListItemTitleWidget extends StatelessWidget {
  const _CustomListListItemTitleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customListBloc = ICustomListBloc.of(context);
    return StreamBuilder<String>(
      stream: customListBloc.titleStream,
      initialData: customListBloc.title,
      builder: (context, snapshot) {
        var title = snapshot.data;
        return Text(
          title,
          textAlign: TextAlign.left,
          style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
        );
      },
    );
  }
}
