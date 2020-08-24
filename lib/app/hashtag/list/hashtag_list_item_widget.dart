import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';

class HashtagListItemWidget extends StatelessWidget {
  final IHashtag hashtag;

  HashtagListItemWidget({
    @required this.hashtag,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: FediPadding.allSmallPadding,
          child: Text(
            hashtag.name,
            style: FediTextStyles.mediumShortDarkGrey,
          ),
        ),
        FediLightGreyDivider()
      ],
    );
  }
}
