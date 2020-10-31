import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
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
      padding: const EdgeInsets.symmetric(vertical: FediSizes.mediumPadding),
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
                buildContent(context: context, card: card)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContent({
    @required BuildContext context,
    @required IPleromaCard card,
  }) =>
      Expanded(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_cardBorderRadius),
                  bottomRight: Radius.circular(_cardBorderRadius)),
              border: Border.all(
                  color: IFediUiColorTheme.of(context).ultraLightGrey)),
          child: Padding(
            padding: FediPadding.allMediumPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                if (card.providerName?.isNotEmpty == true)
                  buildProviderText(
                    context: context,
                    card: card,
                  ),
                if (card.title?.isNotEmpty == true)
                  buildTitleText(
                    context: context,
                    card: card,
                  ),
                if (card.description?.isNotEmpty == true)
                  buildDescriptionText(
                    context: context,
                    card: card,
                  ),
              ],
            ),
          ),
        ),
      );

  Widget buildDescriptionText({
    @required BuildContext context,
    @required IPleromaCard card,
  }) =>
      Expanded(
        child: Text(
          card.description,
          style: IFediUiTextTheme.of(context).bigTallDarkGrey,
        ),
      );

  Text buildTitleText({
    @required BuildContext context,
    @required IPleromaCard card,
  }) {
    return Text(
      card.title,
      maxLines: 2,
      style: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildProviderText({
    @required BuildContext context,
    @required IPleromaCard card,
  }) {
    return Container(
      child: Text(
        card.providerName,
        style: IFediUiTextTheme.of(context).smallTallGrey,
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

  const CardWidget();
}
