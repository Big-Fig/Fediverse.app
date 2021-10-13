import 'dart:io';

import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage();

  @override
  Widget build(BuildContext context) {
    var configService = IConfigService.of(context);

    var gitHubUrl = configService.gitHubUrl;

    var appVersionName = configService.appVersionName;
    var versionString = '$appVersionName(${configService.appVersionCode})';

    return Scaffold(
      backgroundColor: IFediUiColorTheme.of(context).white,
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_about_title,
      ),
      body: SafeArea(
        child: Padding(
          padding: FediPadding.allBigPadding,
          child: Column(
            children: [
              if (configService.webSiteUrl != null)
                _AboutPageRowWidget(
                  label: S.of(context).app_about_field_website_label,
                  value: Uri.parse(configService.webSiteUrl!).host,
                  valueUrl: configService.webSiteUrl!,
                ),
              if (configService.fediverseAccountAcct != null)
                _AboutPageRowWidget(
                  label: S.of(context).app_about_field_followOnFediverse_label,
                  value: configService.fediverseAccountAcct!,
                  valueUrl: configService.fediverseAccountUrl,
                ),
              _AboutPageRowWidget(
                label: S.of(context).app_about_field_version_label,
                value: versionString,
                valueUrl: gitHubUrl != null
                    ? '$gitHubUrl/releases/tag/$appVersionName'
                    : null,
              ),
              _AboutPageRowWidget(
                label: S.of(context).app_about_field_changelog_label,
                value: S.of(context).app_about_learnMore,
                valueUrl: gitHubUrl != null
                    ? '$gitHubUrl/blob/master/CHANGELOG.md'
                    : null,
              ),
              if (configService.helpTranslateUrl != null)
                _AboutPageRowWidget(
                  label: S.of(context).app_about_field_helpTranslate_label,
                  value: S.of(context).app_about_field_helpTranslate_value,
                  valueUrl: configService.helpTranslateUrl,
                ),
              if (configService.gitHubUrl != null)
                _AboutPageRowWidget(
                  label: S.of(context).app_about_field_sourceCode_label,
                  value: 'GitHub',
                  valueUrl: gitHubUrl,
                ),
              if (configService.license != null)
                _AboutPageRowWidget(
                  label: S.of(context).app_about_field_license_label,
                  value: configService.license!,
                  valueUrl: gitHubUrl != null
                      ? '$gitHubUrl/blob/master/LICENSE'
                      : null,
                ),
              if (configService.crashlyticsDetailsUrl != null)
                _AboutPageRowWidget(
                  label: S.of(context).app_about_field_dataGathering_label,
                  value: S.of(context).app_about_learnMore,
                  valueUrl: configService.crashlyticsDetailsUrl,
                ),
              if (configService.pushDetailsUrl != null)
                _AboutPageRowWidget(
                  label: S.of(context).app_about_field_pushNotifications_label,
                  value: S.of(context).app_about_learnMore,
                  valueUrl: configService.pushDetailsUrl,
                ),
              if (gitHubUrl != null)
                _AboutPageRowWidget(
                  label:
                      S.of(context).app_about_field_reportBugSuggestIdea_label,
                  value:
                      S.of(context).app_about_field_reportBugSuggestIdea_value,
                  valueUrl: gitHubUrl,
                ),
              if (Platform.isAndroid &&
                  configService.joinBetaAndroidUrl != null)
                _AboutPageRowWidget(
                  label: S.of(context).app_about_field_joinBeta_label,
                  value: S.of(context).app_about_learnMore,
                  valueUrl: configService.joinBetaAndroidUrl,
                ),
              if (Platform.isIOS && configService.joinBetaIosUrl != null)
                _AboutPageRowWidget(
                  label: S.of(context).app_about_field_joinBeta_label,
                  value: S.of(context).app_about_learnMore,
                  valueUrl: configService.joinBetaIosUrl,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutPageRowWidget extends StatelessWidget {
  final String label;
  final String value;
  final String? valueUrl;

  const _AboutPageRowWidget({
    Key? key,
    required this.label,
    required this.value,
    required this.valueUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = IFediUiTextTheme.of(context).bigTallDarkGrey;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: FediPadding.allSmallPadding,
          child: Text(
            label,
            style: textStyle,
          ),
        ),
        if (valueUrl == null)
          Padding(
            padding: FediPadding.allSmallPadding,
            child: Text(
              value,
              style: textStyle,
            ),
          )
        else
          InkWell(
            onTap: () {
              UrlHelper.handleUrlClick(context: context, url: valueUrl!);
            },
            child: Padding(
              padding: FediPadding.allSmallPadding,
              child: Text(
                value,
                style: textStyle.copyWith(
                  color: IFediUiColorTheme.of(context).primary,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

void goToAboutPage({
  required BuildContext context,
}) {
  Navigator.push(
    context,
    createAboutPageRoute(
      context: context,
    ),
  );
}

MaterialPageRoute<void> createAboutPageRoute({
  required BuildContext context,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => AboutPage(),
    );
