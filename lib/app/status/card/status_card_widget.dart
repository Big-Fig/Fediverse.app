import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _cardImageSize = 114.0;
var _cardBorderRadius = 8.0;

class StatusCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    return StreamBuilder<IPleromaCard>(
        stream: statusBloc.reblogOrOriginalCardStream,
        initialData: statusBloc.reblogOrOriginalCard,
        builder: (context, snapshot) {
          var card = snapshot.data;

          if (card == null) {
            return SizedBox.shrink();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
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
        });
  }

  Widget buildContent(IPleromaCard card) => Expanded(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_cardBorderRadius),
                  bottomRight: Radius.circular(_cardBorderRadius)),
              border: Border.all(color: FediColors.ultraLightGrey)),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (card.providerName != null) buildProviderText(card),
                if (card.title != null) buildTitleText(card),
                if (card.description != null) buildDescriptionText(card),
              ],
            ),
          ),
        ),
      );

  Widget buildDescriptionText(IPleromaCard card) => Expanded(
        child: Text(card.description,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: FediColors.darkGrey,
              fontSize: 15.0,
              height: 1.5,
            )),
      );

  Text buildTitleText(IPleromaCard card) {
    return Text(
      card.title,
      maxLines: 2,
      style: TextStyle(
          color: FediColors.darkGrey,
          fontSize: 16.0,
          height: 1.5,
          fontWeight: FontWeight.w500),
      overflow: TextOverflow.ellipsis,
    );
  }

  Text buildProviderText(IPleromaCard card) {
    return Text(
      card.providerName,
      style: TextStyle(
        color: FediColors.grey,
        fontSize: 12,
        height: 1.5,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildImage(IPleromaCard card) => CachedNetworkImage(
        width: _cardImageSize,
        height: _cardImageSize,
        imageUrl: card.image,
        fit: BoxFit.cover,
        placeholder: (context, url) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: FediCircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );

  StatusCardWidget();
}
