import 'package:fedi/app/cache/files/files_cache_service.dart';
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

const _cardImageSize = 114.0;
const _cardBorderRadius = 8.0;

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = Provider.of<IPleromaCard>(context);

    if (card == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: FediSizes.mediumPadding),
      child: Container(
        height: _cardImageSize,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_cardBorderRadius),
          child: InkWell(
            onTap: () async {
              var url = card.url!;
              await UrlHelper.handleUrlClick(
                context: context,
                url: url,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                if (card.image != null) const _CardImageWidget(),
                const _CardContentWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  const CardWidget();
}

class _CardContentWidget extends StatelessWidget {
  const _CardContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var card = Provider.of<IPleromaCard>(context);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(_cardBorderRadius),
              bottomRight: Radius.circular(_cardBorderRadius)),
          border:
              Border.all(color: IFediUiColorTheme.of(context).ultraLightGrey),
        ),
        child: Padding(
          padding: FediPadding.allMediumPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (card.providerName?.isNotEmpty == true)
                const _CardProviderWidget(),
              if (card.title?.isNotEmpty == true) const _CardTitleWidget(),
              if (card.description?.isNotEmpty == true)
                const _CardDescriptionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardImageWidget extends StatelessWidget {
  const _CardImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var card = Provider.of<IPleromaCard>(context);

    return IFilesCacheService.of(context).createCachedNetworkImageWidget(
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
  }
}

class _CardProviderWidget extends StatelessWidget {
  const _CardProviderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var card = Provider.of<IPleromaCard>(context);

    return Container(
      child: Text(
        card.providerName!,
        style: IFediUiTextTheme.of(context).smallTallGrey,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _CardTitleWidget extends StatelessWidget {
  const _CardTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var card = Provider.of<IPleromaCard>(context);

    return Text(
      card.title!,
      maxLines: 2,
      style: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _CardDescriptionWidget extends StatelessWidget {
  const _CardDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var card = Provider.of<IPleromaCard>(context);

    return Expanded(
      child: Text(
        card.description!,
        style: IFediUiTextTheme.of(context).bigTallDarkGrey,
      ),
    );
  }
}
