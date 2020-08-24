
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/custom_list_page.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
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
    return InkWell(
      onTap: () {
        goToCustomListPage(context: context, customList: customList);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: FediPadding.allSmallPadding,
            child: Text(
              "${customList.title}",
              textAlign: TextAlign.left,
              style: FediTextStyles.mediumShortDarkGrey,
            ),
          ),
          FediLightGreyDivider()
        ],
      ),
    );
  }
}
