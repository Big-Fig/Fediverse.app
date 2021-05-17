import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/hashtag_page.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HashtagListItemWidget extends StatelessWidget {
  const HashtagListItemWidget();

  @override
  Widget build(BuildContext context) {
    var hashtag = Provider.of<IHashtag>(context);

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
              '#${hashtag.name}',
              textAlign: TextAlign.left,
              style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
            ),
          ),
          const FediLightGreyDivider(),
        ],
      ),
    );
  }
}
