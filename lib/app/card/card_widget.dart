import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _cardImageSize = 114.0;
var _cardBorderRadius = 8.0;

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = Provider.of<IPleromaCard>(context, listen: false);

    if (card == null) {
      return SizedBox.shrink();
    }

    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: FediSizes.mediumPadding),
      child: Container(
        height: _cardImageSize,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_cardBorderRadius),
          child: InkWell(
            onTap: () async {
              var url = card.url;
              await UrlHelper.handleUrlClick(context, url);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                if (card.image != null) buildImage(card),
                buildContent(card)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContent(IPleromaCard card) => Expanded(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_cardBorderRadius),
                  bottomRight: Radius.circular(_cardBorderRadius)),
              border: Border.all(color: FediColors.ultraLightGrey)),
          child: Padding(
            padding: FediPadding.allMediumPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                if (card.providerName?.isNotEmpty == true)
                  buildProviderText(card),
                if (card.title?.isNotEmpty == true) buildTitleText(card),
                if (card.description?.isNotEmpty == true)
                  buildDescriptionText(card),
              ],
            ),
          ),
        ),
      );

  Widget buildDescriptionText(IPleromaCard card) => Expanded(
        child: Text(
          card.description,
          style: FediTextStyles.bigTallDarkGrey,
        ),
      );

  Text buildTitleText(IPleromaCard card) {
    return Text(
      card.title,
      maxLines: 2,
      style: FediTextStyles.bigTallBoldDarkGrey,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildProviderText(IPleromaCard card) {
    return Container(
      child: Text(
        card.providerName,
        style: FediTextStyles.smallTallGrey,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget buildImage(IPleromaCard card) => CachedNetworkImage(
        width: _cardImageSize,
        height: _cardImageSize,
        imageUrl: card.image,
        fit: BoxFit.cover,
        placeholder: (context, url) => Padding(
          padding: FediPadding.allBigPadding,
          child: FediCircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Icon(FediIcons.warning),
      );

  CardWidget();
}
