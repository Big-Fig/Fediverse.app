import 'package:fedi/app/custom_list/custom_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/custom_list_page.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListListItemWidget extends StatelessWidget {
  final ICustomList customList;

  CustomListListItemWidget({
    @required this.customList,
  });

  @override
  Widget build(BuildContext context) {
    var customListBloc = ICustomListBloc.of(context, listen: false);
    return InkWell(
      onTap: () {
        goToCustomListPage(context: context, customList: customList);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: FediPadding.allSmallPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${customList.title}",
                  textAlign: TextAlign.left,
                  style: FediTextStyles.mediumShortDarkGrey,
                ),
                Row(
                  children: <Widget>[
                    FediIconButton(
                      icon: Icon(FediIcons.pen),
                      onPressed: () {
                        goToEditCustomListPage(
                            context: context, customList: customList);
                      },
                    ),
                    FediIconButton(
                      icon: Icon(FediIcons.delete),
                      onPressed: () {
                        customListBloc.delete();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          FediLightGreyDivider()
        ],
      ),
    );
  }
}
