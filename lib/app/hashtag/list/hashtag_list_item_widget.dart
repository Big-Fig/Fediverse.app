import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/hashtag_page.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HashtagListItemWidget extends StatelessWidget {
  final IHashtag hashtag;

  HashtagListItemWidget({
    @required this.hashtag,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToHashtagPage(context: context, hashtag: hashtag);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: FediPadding.allBigPadding,
            child: Text(
              "#${hashtag.name}",
              textAlign: TextAlign.left,
              style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
            ),
          ),
          FediLightGreyDivider()
        ],
      ),
    );
  }
}
