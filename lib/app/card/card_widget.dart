import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/mastodon/api/card/mastodon_api_card_model.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _cardWithContentImageSize = 114.0;
const _cardWithoutContentImageSize = _cardWithContentImageSize * 3;

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = Provider.of<IPleromaApiCard?>(context);

    if (card == null) {
      return const SizedBox.shrink();
    }

    var isHaveContent = card.isHaveContent;
    var isHaveImage = card.isHaveImage;

    return ProxyProvider<IPleromaApiCard?, IPleromaApiCard>(
      update: (context, value, previous) => value!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: FediSizes.mediumPadding),
        child: Container(
          height: isHaveContent
              ? _cardWithContentImageSize
              : _cardWithoutContentImageSize,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(FediSizes.smallPadding),
            child: InkWell(
              onTap: () async {
                var url = card.url!;
                await UrlHelper.handleUrlClick(
                  context: context,
                  url: url,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (isHaveImage) const _CardImageWidget(),
                  if (isHaveContent) const _CardContentWidget(),
                ],
              ),
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
    var card = Provider.of<IPleromaApiCard>(context);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(FediSizes.smallPadding),
            // ignore: no-equal-arguments
            bottomRight: Radius.circular(FediSizes.smallPadding),
          ),
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
    var card = Provider.of<IPleromaApiCard>(context);

    return IFilesCacheService.of(context).createCachedNetworkImageWidget(
      width: _cardWithContentImageSize,
      // ignore: no-equal-arguments
      height: _cardWithContentImageSize,
      imageUrl: card.image!,
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
    var card = Provider.of<IPleromaApiCard>(context);

    return Text(
      card.providerName!,
      style: IFediUiTextTheme.of(context).smallTallGrey,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _CardTitleWidget extends StatelessWidget {
  const _CardTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var card = Provider.of<IPleromaApiCard>(context);

    return Text(
      card.title!,
      // ignore: no-magic-number
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
  Widget build(BuildContext context) => ProxyProvider<IPleromaApiCard, String?>(
        update: (BuildContext context, IPleromaApiCard value, previous) =>
            value.description,
        child: ProxyProvider<String?, IHtmlTextBloc>(
          update:
              (BuildContext context, String? value, IHtmlTextBloc? previous) {
            var htmlTextInputData = HtmlTextInputData(
              input: value,
              emojis: null,
            );
            if (previous?.inputData == htmlTextInputData) {
              return previous!;
            }

            return HtmlTextBloc(
              inputData: htmlTextInputData,
              settings: HtmlTextSettings(
                color: IFediUiColorTheme.of(
                  context,
                  listen: false,
                ).darkGrey,
                linkColor: IFediUiColorTheme.of(
                  context,
                  listen: false,
                ).primary,
                shrinkWrap: true,
                // todo: refactor
                // ignore: no-magic-number
                fontSize: 16.0,
                // todo: refactor
                // ignore: no-magic-number
                lineHeight: 1.5,
                drawNewLines: false,
                textMaxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w300,
                textScaleFactor: 1.0,
              ),
            );
          },
          child: Expanded(
            child: HtmlTextWidget(),
          ),
        ),
      );
}
