import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/details/remote_account_details_page.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/form/field/value/duration/duration_value_form_field_row_widget.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/instance/activity/local/local_instance_activity_page.dart';
import 'package:fedi/app/instance/activity/remote/remote_instance_activity_page.dart';
import 'package:fedi/app/instance/details/instance_details_bloc.dart';
import 'package:fedi/app/instance/details/instance_details_widget_keys.dart';
import 'package:fedi/app/instance/directory/local/local_instance_directory_page.dart';
import 'package:fedi/app/instance/directory/remote/remote_instance_directory_page.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/public_timeline/local/local_instance_public_timeline_page.dart';
import 'package:fedi/app/instance/public_timeline/remote/remote_instance_public_timeline_page.dart';
import 'package:fedi/app/instance/trends/local/local_instance_trends_page.dart';
import 'package:fedi/app/instance/trends/remote/remote_instance_trends_page.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/file/file_size_helper.dart';
import 'package:fedi/generated/l10n.dart';

import 'package:unifedi_api/unifedi_api.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger = Logger('instance_details_widget.dart');

final _mbSizeNumberFormat = NumberFormat('#.#');

class InstanceDetailsWidget extends StatelessWidget {
  const InstanceDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: instanceDetailsBloc,
      loadingFinishedBuilder: (context) {
        return FediListSmartRefresherWidget(
          isNeedToAddPaddingForUiTests: false,
          controller: instanceDetailsBloc.refreshController,
          onRefresh: () async {
            try {
              await instanceDetailsBloc.refresh();

              return FediListSmartRefresherLoadingState.loaded;
            } catch (e, stackTrace) {
              _logger.warning(
                () => 'instanceDetailsBloc.refresh',
                e,
                stackTrace,
              );

              return FediListSmartRefresherLoadingState.failed;
            }
          },
          onLoading: null,
          child: const _InstanceDetailsBodyWidget(),
        );
      },
    );
  }
}

class _InstanceDetailsBodyWidget extends StatelessWidget {
  const _InstanceDetailsBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.verticalMediumPadding,
      child: ListView(
        children: [
          Padding(
            padding: FediPadding.allSmallPadding,
            child: Center(
              child: const _InstanceDetailsTitleWidget(),
            ),
          ),
          Center(
            child: Padding(
              padding: FediPadding.allSmallPadding,
              child: const _InstanceDetailsVersionTypeWidget(),
            ),
          ),
          const _InstanceDetailsThumbnailWidget(),
          Padding(
            padding: FediPadding.allSmallPadding,
            child: Center(
              child: const _InstanceDetailsDescriptionWidget(),
            ),
          ),
          const _InstanceDetailsContactAccountWidget(),
          const _InstanceDetailsDirectoryWidget(),
          const _InstanceDetailsTrendsWidget(),
          const _InstanceDetailsActivityWidget(),
          const _InstanceDetailsPublicTimelineWidget(),
          const _InstanceDetailsBodyDetailsWidget(),
          const _InstanceDetailsBodyRegistrationsWidget(),
          const _InstanceDetailsStatsWidget(
            key: Key(InstanceDetailsWidgetKeys.statsKey),
          ),
          const _InstanceDetailsBodyMessagesLimitsWidget(),
          const _InstanceDetailsUnifediApiPollLimitsWidget(),
          const _InstanceDetailsPleromaUploadLimitsWidget(),
          const _InstanceDetailsBodyMetadataWidget(),
          const _InstanceDetailsunifediApiInstanceFederationWidget(),
          const _InstanceDetailsPleromaMetadataFieldsLimitsWidget(),
        ],
      ),
    );
  }
}

class _InstanceDetailsBodyMetadataWidget extends StatelessWidget {
  const _InstanceDetailsBodyMetadataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool>(
      stream: instanceDetailsBloc.isHaveMetadataFieldsStream,
      initialData: instanceDetailsBloc.isHaveMetadataFields,
      builder: (context, snapshot) {
        var isHaveMetadataFields = snapshot.data!;
        if (isHaveMetadataFields) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _InstanceDetailsGroupTitleWidget(
                title: S.of(context).app_instance_details_field_metadata_title,
              ),
              const _InstanceDetailsPleromaMetadataFeaturesWidget(),
              const _InstanceDetailsPleromaMetadataPostFormatsWidget(),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsPleromaUploadLimitsWidget extends StatelessWidget {
  const _InstanceDetailsPleromaUploadLimitsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool>(
      stream: instanceDetailsBloc.isHaveUploadLimitsFieldsStream,
      initialData: instanceDetailsBloc.isHaveUploadLimitsFields,
      builder: (context, snapshot) {
        var isHaveUploadLimitsFields = snapshot.data!;
        if (isHaveUploadLimitsFields) {
          return Column(
            children: [
              _InstanceDetailsGroupTitleWidget(
                title:
                    S.of(context).app_instance_details_field_uploadLimits_title,
              ),
              const _InstanceDetailsPleromaUploadMediaLimitWidget(),
              const _InstanceDetailsPleromaUploadAccountAvatarLimitWidget(),
              const _InstanceDetailsPleromaUploadAccountBackgroundLimitWidget(),
              const _InstanceDetailsPleromaUploadAccountBannerLimitWidget(),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsBodyMessagesLimitsWidget extends StatelessWidget {
  const _InstanceDetailsBodyMessagesLimitsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool>(
      stream: instanceDetailsBloc.isHaveMessagesLimitsFieldsStream,
      initialData: instanceDetailsBloc.isHaveMessagesLimitsFields,
      builder: (context, snapshot) {
        var isHaveMessagesLimitsFields = snapshot.data!;
        if (isHaveMessagesLimitsFields) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _InstanceDetailsGroupTitleWidget(
                title: S
                    .of(context)
                    .app_instance_details_field_messagesLimits_title,
              ),
              const _InstanceDetailsPleromaMaxTootCharsLimitWidget(),
              const _InstanceDetailsunifediApiChatMessageLimitWidget(),
              const _InstanceDetailsPleromaImageDescriptionLimitWidget(),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsBodyRegistrationsWidget extends StatelessWidget {
  const _InstanceDetailsBodyRegistrationsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool>(
      stream: instanceDetailsBloc.isHaveRegistrationsFieldsStream,
      initialData: instanceDetailsBloc.isHaveRegistrationsFields,
      builder: (context, snapshot) {
        var isHaveRegistrationsFields = snapshot.data!;

        if (isHaveRegistrationsFields) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _InstanceDetailsGroupTitleWidget(
                title: S
                    .of(context)
                    .app_instance_details_field_registrationsLimits_title,
              ),
              const _InstanceDetailsRegistrationEnabledWidget(),
              const _InstanceDetailsApprovalRequiredWidget(),
              const _InstanceDetailsInvitesEnablesWidget(),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsBodyDetailsWidget extends StatelessWidget {
  const _InstanceDetailsBodyDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool>(
      stream: instanceDetailsBloc.isHaveDetailsFieldsStream,
      initialData: instanceDetailsBloc.isHaveDetailsFields,
      builder: (context, snapshot) {
        var isHaveDetailsFields = snapshot.data!;
        if (isHaveDetailsFields) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _InstanceDetailsGroupTitleWidget(
                title: S.of(context).app_instance_details_field_details_title,
              ),
              const _InstanceDetailsEmailWidget(),
              const _InstanceDetailsVersionWidget(),
              const _InstanceDetailsLanguagesWidget(),
              const _InstanceDetailsVapidPublicKeyWidget(),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsTitleWidget extends StatelessWidget {
  const _InstanceDetailsTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<String?>(
      stream: instanceDetailsBloc.titleStream,
      initialData: instanceDetailsBloc.title,
      builder: (context, snapshot) {
        var title = snapshot.data;

        if (title?.isNotEmpty == true) {
          return Text(
            title!,
            style: IFediUiTextTheme.of(context).bigBoldDarkGrey,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsDescriptionWidget extends StatelessWidget {
  const _InstanceDetailsDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<String?>(
      stream: instanceDetailsBloc
          .descriptionOrShortDescriptionWithParsedHashtagsStream,
      initialData:
          instanceDetailsBloc.descriptionOrShortDescriptionWithParsedHashtags,
      builder: (context, snapshot) {
        var descriptionOrShortDescription = snapshot.data;
        var textStyle = IFediUiTextTheme.of(context).bigTallMediumGrey;
        var fediUiColorTheme = IFediUiColorTheme.of(context);
        var textScaleFactor = MediaQuery.of(context).textScaleFactor;
        if (descriptionOrShortDescription?.isNotEmpty == true) {
          return Provider<String>.value(
            value: descriptionOrShortDescription!,
            child: DisposableProxyProvider<String, IHtmlTextBloc>(
              update: (context, descriptionOrShortDescription, previous) {
                var htmlTextInputData = HtmlTextInputData(
                  input: descriptionOrShortDescription,
                  emojis: null,
                );
                if (previous?.inputData == htmlTextInputData) {
                  return previous!;
                }

                var htmlTextBloc = HtmlTextBloc(
                  inputData: htmlTextInputData,
                  settings: HtmlTextSettings(
                    paragraphDisplay: Display.BLOCK,
                    fontSize: textStyle.fontSize,
                    color: textStyle.color,
                    lineHeight: textStyle.height,
                    fontWeight: textStyle.fontWeight,
                    textAlign: TextAlign.center,
                    linkColor: fediUiColorTheme.primary,
                    textMaxLines: null,
                    textScaleFactor: textScaleFactor,
                    drawNewLines: true,
                    textOverflow: null,
                  ),
                );

                htmlTextBloc.linkClickedStream.listen(
                  (url) {
                    UrlHelper.handleUrlClickWithInstanceLocation(
                      context: context,
                      url: url,
                      instanceLocationBloc: instanceDetailsBloc,
                    );
                  },
                ).disposeWith(htmlTextBloc);

                return htmlTextBloc;
              },
              child: const HtmlTextWidget(),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsVersionTypeWidget extends StatelessWidget {
  const _InstanceDetailsVersionTypeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<UnifediApiInstanceType>(
      stream: instanceDetailsBloc.instanceTypeStream,
      initialData: instanceDetailsBloc.instanceType,
      builder: (context, snapshot) {
        var instanceType = snapshot.data!;

        if (instanceType != null) {
          String instanceTypeString;

          instanceTypeString = instanceType.map(pleroma: (_) =>S
              .of(context)
              .app_instance_details_field_pleroma_metadata_fields_verstionType_value_pleroma,
            mastodon: (_) => S
                .of(context)
                .app_instance_details_field_pleroma_metadata_fields_verstionType_value_mastodon,
            unknown: (_) => S
                .of(context)
                .app_instance_details_field_pleroma_metadata_fields_verstionType_value_unknown,
          );

          return Text(
            instanceTypeString.toUpperCase(),
            style: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsEmailWidget extends StatelessWidget {
  const _InstanceDetailsEmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<String?>(
      stream: instanceDetailsBloc.emailStream,
      initialData: instanceDetailsBloc.email,
      builder: (context, snapshot) {
        var email = snapshot.data;

        if (email?.isNotEmpty == true) {
          return Padding(
            padding: _BaseInstanceDetailsRowWidget.padding,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _InstanceDetailsRowLabelWidget(
                  label: S.of(context).app_instance_details_field_email_label,
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      UrlHelper.handleUrlClick(
                        context: context,
                        url: 'mailto:$email',
                      );
                    },
                    child: _InstanceDetailsRowValueWidget(
                      value: email!,
                      customColor: IFediUiColorTheme.of(context).primary,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _SimpleInstanceDetailsRowWidget extends StatelessWidget {
  const _SimpleInstanceDetailsRowWidget({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return _BaseInstanceDetailsRowWidget(
      label: label,
      value: value,
      valueIcon: null,
      valueOnClick: null,
    );
  }
}

class _BaseInstanceDetailsRowWidget extends StatelessWidget {
  const _BaseInstanceDetailsRowWidget({
    Key? key,
    required this.label,
    required this.value,
    required this.valueIcon,
    required this.valueOnClick,
  }) : super(key: key);

  final String label;
  final String value;
  final Icon? valueIcon;
  final OnClickUiCallback? valueOnClick;

  static const padding = FediPadding.allBigPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.allBigPadding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _InstanceDetailsRowLabelWidget(label: label),
          Flexible(
            child: InkWell(
              onTap: () {
                if (valueOnClick != null) {
                  valueOnClick!(context);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: _InstanceDetailsRowValueWidget(value: value),
                  ),
                  if (valueIcon != null)
                    Padding(
                      padding: FediPadding.horizontalSmallPadding,
                      child: valueIcon!,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InstanceDetailsRowValueWidget extends StatelessWidget {
  final String value;
  final Color? customColor;

  const _InstanceDetailsRowValueWidget({
    Key? key,
    required this.value,
    this.customColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: TextAlign.end,
      style: IFediUiTextTheme.of(context)
          .bigTallMediumGrey
          .copyWith(color: customColor),
      overflow: TextOverflow.visible,
    );
  }
}

class _InstanceDetailsRowLabelWidget extends StatelessWidget {
  const _InstanceDetailsRowLabelWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        // todo: refactor
        // ignore: no-magic-number
        minWidth: 100,
      ),
      child: Text(
        label,
        style: IFediUiTextTheme.of(context).bigTallDarkGrey,
      ),
    );
  }
}

class _InstanceDetailsVersionWidget extends StatelessWidget {
  const _InstanceDetailsVersionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<String?>(
      stream: instanceDetailsBloc.versionStream,
      initialData: instanceDetailsBloc.version,
      builder: (context, snapshot) {
        var version = snapshot.data;

        if (version?.isNotEmpty == true) {
          return _SimpleInstanceDetailsRowWidget(
            label: S.of(context).app_instance_details_field_version_label,
            value: version!,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsStatsWidget extends StatelessWidget {
  const _InstanceDetailsStatsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool>(
      stream: instanceDetailsBloc.isHaveStatsFieldsStream,
      initialData: instanceDetailsBloc.isHaveStatsFields,
      builder: (context, snapshot) {
        var isHaveStatsFields = snapshot.data!;
        if (isHaveStatsFields) {
          return StreamBuilder<IUnifediApiInstanceStats?>(
            stream: instanceDetailsBloc.statsStream,
            initialData: instanceDetailsBloc.stats,
            builder: (context, snapshot) {
              var stats = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InstanceDetailsGroupTitleWidget(
                    title: S.of(context).app_instance_details_field_stats_title,
                  ),
                  if (stats.domainCount != null)
                    _SimpleInstanceDetailsRowWidget(
                      label: S
                          .of(context)
                          .app_instance_details_field_stats_domainCount_label,
                      value: stats.domainCount!.toString(),
                    ),
                  if (stats.statusCount != null)
                    _SimpleInstanceDetailsRowWidget(
                      label: S
                          .of(context)
                          .app_instance_details_field_stats_statusCount_label,
                      value: stats.statusCount!.toString(),
                    ),
                  if (stats.userCount != null)
                    _SimpleInstanceDetailsRowWidget(
                      label: S
                          .of(context)
                          .app_instance_details_field_stats_userCount_label,
                      value: stats.userCount!.toString(),
                    ),
                ],
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsGroupTitleWidget extends StatelessWidget {
  const _InstanceDetailsGroupTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.horizontalBigPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FediSmallVerticalSpacer(),
          Text(
            title,
            style: IFediUiTextTheme.of(context).bigBoldDarkGrey,
          ),
          const FediSmallVerticalSpacer(),
          const FediUltraLightGreyDivider(),
        ],
      ),
    );
  }
}

class _InstanceDetailsThumbnailWidget extends StatelessWidget {
  const _InstanceDetailsThumbnailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<String?>(
      stream: instanceDetailsBloc.thumbnailStream,
      initialData: instanceDetailsBloc.thumbnail,
      builder: (context, snapshot) {
        var thumbnail = snapshot.data;

        if (thumbnail?.isNotEmpty == true) {
          var filesCacheService = IFilesCacheService.of(context);

          return filesCacheService.createCachedNetworkImageWidget(
            imageUrl: thumbnail!,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsLanguagesWidget extends StatelessWidget {
  const _InstanceDetailsLanguagesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<List<String>?>(
      stream: instanceDetailsBloc.languagesStream,
      initialData: instanceDetailsBloc.languages,
      builder: (context, snapshot) {
        var languages = snapshot.data;

        if (languages?.isNotEmpty == true) {
          return _SimpleInstanceDetailsRowWidget(
            label: S.of(context).app_instance_details_field_languages_label,
            value: languages?.join('\n') ?? '',
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsRegistrationEnabledWidget extends StatelessWidget {
  const _InstanceDetailsRegistrationEnabledWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool?>(
      stream: instanceDetailsBloc.registrationsStream,
      initialData: instanceDetailsBloc.registrations,
      builder: (context, snapshot) {
        var registrations = snapshot.data;

        if (registrations != null) {
          return _SimpleInstanceDetailsRowWidget(
            label: S.of(context).app_instance_details_field_registrations_label,
            value: registrations
                ? S.of(context).app_instance_details_value_bool_true
                : S.of(context).app_instance_details_value_bool_false,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsApprovalRequiredWidget extends StatelessWidget {
  const _InstanceDetailsApprovalRequiredWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool?>(
      stream: instanceDetailsBloc.approvalRequiredStream,
      initialData: instanceDetailsBloc.approvalRequired,
      builder: (context, snapshot) {
        var approvalRequired = snapshot.data;

        if (approvalRequired != null) {
          return _SimpleInstanceDetailsRowWidget(
            label:
                S.of(context).app_instance_details_field_approvalRequired_label,
            value: approvalRequired
                ? S.of(context).app_instance_details_value_bool_true
                : S.of(context).app_instance_details_value_bool_false,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsInvitesEnablesWidget extends StatelessWidget {
  const _InstanceDetailsInvitesEnablesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool?>(
      stream: instanceDetailsBloc.invitesEnabledStream,
      initialData: instanceDetailsBloc.invitesEnabled,
      builder: (context, snapshot) {
        var invitesEnabled = snapshot.data;

        if (invitesEnabled != null) {
          return _SimpleInstanceDetailsRowWidget(
            label:
                S.of(context).app_instance_details_field_invitesEnabled_label,
            value: invitesEnabled
                ? S.of(context).app_instance_details_value_bool_true
                : S.of(context).app_instance_details_value_bool_false,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsContactAccountWidget extends StatelessWidget {
  const _InstanceDetailsContactAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    var instanceLocation = instanceDetailsBloc.instanceLocation;

    var isLocal = instanceLocation == InstanceLocation.local;

    return StreamBuilder<IUnifediApiAccount?>(
      stream: instanceDetailsBloc.contactAccountStream,
      initialData: instanceDetailsBloc.contactAccount,
      builder: (context, snapshot) {
        var contactAccount = snapshot.data;

        if (contactAccount != null) {
          var account = contactAccount.toDbAccountWrapper();

          return _BaseInstanceDetailsRowWidget(
            label:
                S.of(context).app_instance_details_field_contactAccount_label,
            valueIcon: Icon(
              FediIcons.chevron_right,
              color: IFediUiColorTheme.of(context).darkGrey,
            ),
            valueOnClick: (BuildContext context) {
              _goToAccount(
                context: context,
                isLocal: isLocal,
                account: account,
              );
            },
            value: account.acct,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void _goToAccount({
    required BuildContext context,
    required bool isLocal,
    required IAccount account,
  }) {
    if (isLocal) {
      goToLocalAccountDetailsPage(
        context,
        account: account,
      );
    } else {
      goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
        context,
        remoteInstanceAccount: account,
      );
    }
  }
}

class _InstanceDetailsDirectoryWidget extends StatelessWidget {
  const _InstanceDetailsDirectoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    var instanceLocation = instanceDetailsBloc.instanceLocation;

    var isLocal = instanceLocation == InstanceLocation.local;

    var isDirectorySupported = instanceDetailsBloc.isMastodon;

    if (isDirectorySupported) {
      return _BaseInstanceDetailsRowWidget(
        label: S.of(context).app_instance_details_field_directory_label,
        valueIcon: Icon(
          FediIcons.chevron_right,
          color: IFediUiColorTheme.of(context).darkGrey,
        ),
        valueOnClick: (BuildContext context) {
          _goToAccountDirectory(
            context: context,
            isLocal: isLocal,
            instanceDetailsBloc: instanceDetailsBloc,
          );
        },
        value: S.of(context).app_instance_details_field_directory_value,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  void _goToAccountDirectory({
    required BuildContext context,
    required bool isLocal,
    required IInstanceDetailsBloc instanceDetailsBloc,
  }) {
    if (isLocal) {
      goToLocalInstanceDirectoryPage(context);
    } else {
      goToRemoteInstanceDirectoryPage(
        context,
        remoteInstanceUri: instanceDetailsBloc.instanceUri,
      );
    }
  }
}

class _InstanceDetailsTrendsWidget extends StatelessWidget {
  const _InstanceDetailsTrendsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    var instanceLocation = instanceDetailsBloc.instanceLocation;

    var isLocal = instanceLocation == InstanceLocation.local;

    var isTrendsSupported = instanceDetailsBloc.isMastodon;

    if (isTrendsSupported) {
      return _BaseInstanceDetailsRowWidget(
        label: S.of(context).app_instance_details_field_trends_label,
        valueIcon: Icon(
          FediIcons.chevron_right,
          color: IFediUiColorTheme.of(context).darkGrey,
        ),
        valueOnClick: (BuildContext context) {
          _goToTrends(
            context: context,
            isLocal: isLocal,
            instanceDetailsBloc: instanceDetailsBloc,
          );
        },
        value: S.of(context).app_instance_details_field_trends_value,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  void _goToTrends({
    required BuildContext context,
    required bool isLocal,
    required IInstanceDetailsBloc instanceDetailsBloc,
  }) {
    if (isLocal) {
      goToLocalInstanceTrendsPage(context);
    } else {
      goToRemoteInstanceTrendsPage(
        context,
        remoteInstanceUri: instanceDetailsBloc.instanceUri,
      );
    }
  }
}

class _InstanceDetailsPublicTimelineWidget extends StatelessWidget {
  const _InstanceDetailsPublicTimelineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    var instanceLocation = instanceDetailsBloc.instanceLocation;

    var isLocal = instanceLocation == InstanceLocation.local;

    return _BaseInstanceDetailsRowWidget(
      label: S.of(context).app_instance_details_field_publicTimeline_label,
      valueIcon: Icon(
        FediIcons.chevron_right,
        color: IFediUiColorTheme.of(context).darkGrey,
      ),
      valueOnClick: (BuildContext context) {
        _goToPublicTimeline(
          context: context,
          isLocal: isLocal,
          instanceDetailsBloc: instanceDetailsBloc,
        );
      },
      value: S.of(context).app_instance_details_field_publicTimeline_value,
    );
  }

  void _goToPublicTimeline({
    required BuildContext context,
    required bool isLocal,
    required IInstanceDetailsBloc instanceDetailsBloc,
  }) {
    if (isLocal) {
      goToLocalInstancePublicTimelinePage(
        context: context,
        unifediApiInstance: instanceDetailsBloc.instance!,
      );
    } else {
      goToRemoteInstancePublicTimelinePage(
        context: context,
        remoteInstanceUri: instanceDetailsBloc.instanceUri,
        unifediApiInstance: instanceDetailsBloc.instance!,
      );
    }
  }
}

class _InstanceDetailsActivityWidget extends StatelessWidget {
  const _InstanceDetailsActivityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    var instanceLocation = instanceDetailsBloc.instanceLocation;

    var isLocal = instanceLocation == InstanceLocation.local;

    var isActivitySupported = instanceDetailsBloc.isMastodon;

    if (isActivitySupported) {
      return _BaseInstanceDetailsRowWidget(
        label: S.of(context).app_instance_details_field_activity_label,
        valueIcon: Icon(
          FediIcons.chevron_right,
          color: IFediUiColorTheme.of(context).darkGrey,
        ),
        valueOnClick: (BuildContext context) {
          _goToActivity(
            context: context,
            isLocal: isLocal,
            instanceDetailsBloc: instanceDetailsBloc,
          );
        },
        value: S.of(context).app_instance_details_field_activity_value,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  void _goToActivity({
    required BuildContext context,
    required bool isLocal,
    required IInstanceDetailsBloc instanceDetailsBloc,
  }) {
    if (isLocal) {
      goToLocalInstanceActivityPage(context);
    } else {
      goToRemoteInstanceActivityPage(
        context,
        remoteInstanceUri: instanceDetailsBloc.instanceUri,
      );
    }
  }
}

class _InstanceDetailsPleromaMaxTootCharsLimitWidget extends StatelessWidget {
  const _InstanceDetailsPleromaMaxTootCharsLimitWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<int?>(
      stream: instanceDetailsBloc.maxTootCharsStream,
      initialData: instanceDetailsBloc.maxTootChars,
      builder: (context, snapshot) {
        var maxTootChars = snapshot.data;

        if (maxTootChars != null) {
          return _SimpleInstanceDetailsRowWidget(
            label: S.of(context).app_instance_details_field_maxTootChars_label,
            value: maxTootChars.toString(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsunifediApiChatMessageLimitWidget extends StatelessWidget {
  const _InstanceDetailsunifediApiChatMessageLimitWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<int?>(
      stream: instanceDetailsBloc.chatLimitStream,
      initialData: instanceDetailsBloc.chatLimit,
      builder: (context, snapshot) {
        var chatLimit = snapshot.data;

        if (chatLimit != null) {
          return _SimpleInstanceDetailsRowWidget(
            label: S.of(context).app_instance_details_field_chatLimit_label,
            value: chatLimit.toString(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsPleromaImageDescriptionLimitWidget
    extends StatelessWidget {
  const _InstanceDetailsPleromaImageDescriptionLimitWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<int?>(
      stream: instanceDetailsBloc.descriptionLimitStream,
      initialData: instanceDetailsBloc.descriptionLimit,
      builder: (context, snapshot) {
        var descriptionLimit = snapshot.data;

        if (descriptionLimit != null) {
          return _SimpleInstanceDetailsRowWidget(
            label: S
                .of(context)
                .app_instance_details_field_imageDescriptionLimit_label,
            value: descriptionLimit.toString(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsUnifediApiPollLimitsWidget extends StatelessWidget {
  const _InstanceDetailsUnifediApiPollLimitsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool>(
      stream: instanceDetailsBloc.isHaveMessagesLimitsFieldsStream,
      initialData: instanceDetailsBloc.isHaveMessagesLimitsFields,
      builder: (context, snapshot) {
        var isHaveMessagesLimitsFields = snapshot.data!;
        if (isHaveMessagesLimitsFields) {
          return StreamBuilder<IUnifediApiInstancePollLimits?>(
            stream: instanceDetailsBloc.pollLimitsStream,
            initialData: instanceDetailsBloc.pollLimits,
            builder: (context, snapshot) {
              var pollLimits = snapshot.data;

              if (pollLimits != null) {
                return _InstanceDetailsUnifediApiPollLimitsBodyWidget(
                  pollLimits: pollLimits,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsUnifediApiPollLimitsBodyWidget extends StatelessWidget {
  const _InstanceDetailsUnifediApiPollLimitsBodyWidget({
    Key? key,
    required this.pollLimits,
  }) : super(key: key);

  final IUnifediApiInstancePollLimits pollLimits;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _InstanceDetailsGroupTitleWidget(
          title: S.of(context).app_instance_details_field_pollLimit_title,
        ),
        if (pollLimits.minExpiration != null)
          _SimpleInstanceDetailsRowWidget(
            label: S
                .of(context)
                .app_instance_details_field_pollLimit_minExpiration_label,
            value: formatDuration(
              context: context,
              duration: Duration(seconds: pollLimits.minExpiration!),
            ),
          ),
        if (pollLimits.maxExpiration != null)
          _SimpleInstanceDetailsRowWidget(
            label: S
                .of(context)
                .app_instance_details_field_pollLimit_maxExpiration_label,
            value: formatDuration(
              context: context,
              duration: Duration(seconds: pollLimits.maxExpiration!),
            ),
          ),
        if (pollLimits.maxOptionChars != null)
          _SimpleInstanceDetailsRowWidget(
            label: S
                .of(context)
                .app_instance_details_field_pollLimit_maxOptionsChars_label,
            value: pollLimits.maxOptionChars!.toString(),
          ),
        if (pollLimits.maxOptions != null)
          _SimpleInstanceDetailsRowWidget(
            label: S
                .of(context)
                .app_instance_details_field_pollLimit_maxOptions_label,
            value: pollLimits.maxOptions!.toString(),
          ),
      ],
    );
  }
}

class _InstanceDetailsPleromaUploadMediaLimitWidget extends StatelessWidget {
  const _InstanceDetailsPleromaUploadMediaLimitWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<int?>(
      stream: instanceDetailsBloc.uploadLimitStream,
      initialData: instanceDetailsBloc.uploadLimit,
      builder: (context, snapshot) {
        var uploadLimit = snapshot.data;

        if (uploadLimit != null) {
          return _SimpleInstanceDetailsRowWidget(
            label: S.of(context).app_instance_details_field_uploadMedia_label,
            value: S.of(context).app_instance_details_value_sizeInMb(
                  _mbSizeNumberFormat.format(
                    FileSizeHelper.convertBytesToMegaBytes(uploadLimit),
                  ),
                ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsPleromaUploadAccountAvatarLimitWidget
    extends StatelessWidget {
  const _InstanceDetailsPleromaUploadAccountAvatarLimitWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<int?>(
      stream: instanceDetailsBloc.avatarUploadLimitStream,
      initialData: instanceDetailsBloc.avatarUploadLimit,
      builder: (context, snapshot) {
        var avatarUploadLimit = snapshot.data;

        if (avatarUploadLimit != null) {
          return _SimpleInstanceDetailsRowWidget(
            label: S.of(context).app_instance_details_field_uploadAvatar_label,
            value: S.of(context).app_instance_details_value_sizeInMb(
                  _mbSizeNumberFormat.format(
                    FileSizeHelper.convertBytesToMegaBytes(avatarUploadLimit),
                  ),
                ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsPleromaUploadAccountBackgroundLimitWidget
    extends StatelessWidget {
  const _InstanceDetailsPleromaUploadAccountBackgroundLimitWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<int?>(
      stream: instanceDetailsBloc.backgroundUploadLimitStream,
      initialData: instanceDetailsBloc.backgroundUploadLimit,
      builder: (context, snapshot) {
        var backgroundUploadLimit = snapshot.data;

        if (backgroundUploadLimit != null) {
          return _SimpleInstanceDetailsRowWidget(
            label:
                S.of(context).app_instance_details_field_uploadBackground_label,
            value: S.of(context).app_instance_details_value_sizeInMb(
                  _mbSizeNumberFormat.format(
                    FileSizeHelper.convertBytesToMegaBytes(
                      backgroundUploadLimit,
                    ),
                  ),
                ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsPleromaUploadAccountBannerLimitWidget
    extends StatelessWidget {
  const _InstanceDetailsPleromaUploadAccountBannerLimitWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<int?>(
      stream: instanceDetailsBloc.bannerUploadLimitStream,
      initialData: instanceDetailsBloc.bannerUploadLimit,
      builder: (context, snapshot) {
        var bannerUploadLimit = snapshot.data;

        if (bannerUploadLimit != null) {
          return _SimpleInstanceDetailsRowWidget(
            label: S.of(context).app_instance_details_field_uploadBanner_label,
            value: S.of(context).app_instance_details_value_sizeInMb(
                  _mbSizeNumberFormat.format(
                    FileSizeHelper.convertBytesToMegaBytes(
                      bannerUploadLimit,
                    ),
                  ),
                ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsPleromaMetadataFeaturesWidget extends StatelessWidget {
  const _InstanceDetailsPleromaMetadataFeaturesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<List<String>?>(
      stream: instanceDetailsBloc.pleromaMetadataFeaturesStream,
      initialData: instanceDetailsBloc.pleromaMetadataFeatures,
      builder: (context, snapshot) {
        var pleromaMetadataFeatures = snapshot.data;

        if (pleromaMetadataFeatures?.isNotEmpty == true) {
          return _SimpleInstanceDetailsRowWidget(
            label: S
                .of(context)
                .app_instance_details_field_pleroma_metadata_features_label,
            value: pleromaMetadataFeatures?.join('\n') ?? '',
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsunifediApiInstanceFederationWidget extends StatelessWidget {
  const _InstanceDetailsunifediApiInstanceFederationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool>(
      stream: instanceDetailsBloc.isHaveFederationFieldsStream,
      initialData: instanceDetailsBloc.isHaveFederationFields,
      builder: (context, snapshot) {
        var isHaveFederationFields = snapshot.data!;
        if (isHaveFederationFields) {
          return StreamBuilder<
              IUnifediApiInstanceFederation?>(
            stream: instanceDetailsBloc.unifediApiInstanceFederationStream,
            initialData: instanceDetailsBloc.unifediApiInstanceFederation,
            builder: (context, snapshot) {
              var unifediApiInstanceFederation = snapshot.data;

              if (unifediApiInstanceFederation != null) {
                return _buildBody(
                  context,
                  unifediApiInstanceFederation,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    IUnifediApiInstanceFederation unifediApiInstanceFederation,
  ) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          __InstanceDetailsUnifediApiInstanceFederationTitleWidget(),
          if (unifediApiInstanceFederation.enabled != null)
            _InstanceDetailsUnifediApiInstanceFederationEnabledFieldWidget(
              unifediApiInstanceFederation: unifediApiInstanceFederation,
            ),
          if (unifediApiInstanceFederation.exclusions != null)
            _InstanceDetailsUnifediApiInstanceFederationExclusionsWidget(
              unifediApiInstanceFederation: unifediApiInstanceFederation,
            ),
          if (unifediApiInstanceFederation.mrfPolicies?.isNotEmpty == true)
            _InstanceDetailsUnifediApiInstanceFederationMfrPoliciesWidget(
              unifediApiInstanceFederation: unifediApiInstanceFederation,
            ),
          if (unifediApiInstanceFederation.mrfObjectAge?.threshold != null)
            _InstanceDetailsUnifediApiInstanceFederationMfrObjectAgeThresholdWidget(
              unifediApiInstanceFederation: unifediApiInstanceFederation,
            ),
          if (unifediApiInstanceFederation.mrfObjectAge?.actions != null)
            _InstanceDetailsUnifediApiInstanceFederationMfrObjectAgeActionsWidget(
              unifediApiInstanceFederation: unifediApiInstanceFederation,
            ),
          if (unifediApiInstanceFederation.quarantinedInstances?.isNotEmpty ==
              true)
            _InstanceDetailsunifediApiInstanceFederationQuarantinedInstancesWidget(
              unifediApiInstanceFederation: unifediApiInstanceFederation,
            ),
        ],
      );
}

class _InstanceDetailsUnifediApiInstanceFederationMfrObjectAgeActionsWidget
    extends StatelessWidget {
  final IUnifediApiInstanceFederation
      unifediApiInstanceFederation;

  const _InstanceDetailsUnifediApiInstanceFederationMfrObjectAgeActionsWidget({
    Key? key,
    required this.unifediApiInstanceFederation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SimpleInstanceDetailsRowWidget(
      label: S
          .of(context)
          .app_instance_details_field_federation_mrfObjectAge_actions_label,
      value: unifediApiInstanceFederation.mrfObjectAge!.actions!.join('\n'),
    );
  }
}

class _InstanceDetailsunifediApiInstanceFederationQuarantinedInstancesWidget
    extends StatelessWidget {
  const _InstanceDetailsunifediApiInstanceFederationQuarantinedInstancesWidget({
    Key? key,
    required this.unifediApiInstanceFederation,
  }) : super(key: key);

  final IUnifediApiInstanceFederation
      unifediApiInstanceFederation;

  @override
  Widget build(BuildContext context) {
    return _SimpleInstanceDetailsRowWidget(
      label: S
          .of(context)
          .app_instance_details_field_federation_quarantinedInstances_label,
      value: unifediApiInstanceFederation.quarantinedInstances!.join('\n'),
    );
  }
}

class _InstanceDetailsUnifediApiInstanceFederationMfrObjectAgeThresholdWidget
    extends StatelessWidget {
  const _InstanceDetailsUnifediApiInstanceFederationMfrObjectAgeThresholdWidget({
    Key? key,
    required this.unifediApiInstanceFederation,
  }) : super(key: key);

  final IUnifediApiInstanceFederation
      unifediApiInstanceFederation;

  @override
  Widget build(BuildContext context) {
    return _SimpleInstanceDetailsRowWidget(
      label: S
          .of(context)
          .app_instance_details_field_federation_mrfObjectAge_threshold_label,
      value: formatDuration(
        context: context,
        duration: Duration(
          seconds: unifediApiInstanceFederation.mrfObjectAge!.threshold!,
        ),
      ),
    );
  }
}

class _InstanceDetailsUnifediApiInstanceFederationMfrPoliciesWidget
    extends StatelessWidget {
  const _InstanceDetailsUnifediApiInstanceFederationMfrPoliciesWidget({
    Key? key,
    required this.unifediApiInstanceFederation,
  }) : super(key: key);

  final IUnifediApiInstanceFederation
      unifediApiInstanceFederation;

  @override
  Widget build(BuildContext context) {
    return _SimpleInstanceDetailsRowWidget(
      label:
          S.of(context).app_instance_details_field_federation_mrfPolicies_label,
      value: unifediApiInstanceFederation.mrfPolicies!.join('\n'),
    );
  }
}

class _InstanceDetailsUnifediApiInstanceFederationExclusionsWidget
    extends StatelessWidget {
  const _InstanceDetailsUnifediApiInstanceFederationExclusionsWidget({
    Key? key,
    required this.unifediApiInstanceFederation,
  }) : super(key: key);

  final IUnifediApiInstanceFederation
      unifediApiInstanceFederation;

  @override
  Widget build(BuildContext context) {
    return _SimpleInstanceDetailsRowWidget(
      label:
          S.of(context).app_instance_details_field_federation_exclusions_label,
      value: unifediApiInstanceFederation.enabled!
          ? S.of(context).app_instance_details_value_bool_true
          : S.of(context).app_instance_details_value_bool_false,
    );
  }
}

class _InstanceDetailsUnifediApiInstanceFederationEnabledFieldWidget
    extends StatelessWidget {
  const _InstanceDetailsUnifediApiInstanceFederationEnabledFieldWidget({
    Key? key,
    required this.unifediApiInstanceFederation,
  }) : super(key: key);

  final IUnifediApiInstanceFederation
      unifediApiInstanceFederation;

  @override
  Widget build(BuildContext context) {
    return _SimpleInstanceDetailsRowWidget(
      label: S.of(context).app_instance_details_field_federation_enabled_label,
      value: unifediApiInstanceFederation.enabled!
          ? S.of(context).app_instance_details_value_bool_true
          : S.of(context).app_instance_details_value_bool_false,
    );
  }
}

class __InstanceDetailsUnifediApiInstanceFederationTitleWidget
    extends StatelessWidget {
  const __InstanceDetailsUnifediApiInstanceFederationTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _InstanceDetailsGroupTitleWidget(
      title: S.of(context).app_instance_details_field_federation_title,
    );
  }
}

class _InstanceDetailsPleromaMetadataFieldsLimitsWidget
    extends StatelessWidget {
  const _InstanceDetailsPleromaMetadataFieldsLimitsWidget({
    Key? key,
  }) : super(key: key);

  @override
  // todo: refactor
  // ignore: long-method
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<bool>(
      stream: instanceDetailsBloc.isHaveMessagesLimitsFieldsStream,
      initialData: instanceDetailsBloc.isHaveMessagesLimitsFields,
      builder: (context, snapshot) {
        var isHaveMessagesLimitsFields = snapshot.data!;

        if (isHaveMessagesLimitsFields) {
          return StreamBuilder<
              IUnifediApiInstanceFieldLimits?>(
            stream: instanceDetailsBloc.pleromaMetadataFieldsLimitsStream,
            initialData: instanceDetailsBloc.pleromaMetadataFieldsLimits,
            builder: (context, snapshot) {
              var pleromaMetadataFieldsLimits = snapshot.data;

              if (pleromaMetadataFieldsLimits != null) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _InstanceDetailsGroupTitleWidget(
                      title: S
                          .of(context)
                          .app_instance_details_field_pleroma_metadata_fields_title,
                    ),
                    if (pleromaMetadataFieldsLimits.maxFields != null)
                      _SimpleInstanceDetailsRowWidget(
                        label: S
                            .of(context)
                            .app_instance_details_field_pleroma_metadata_fields_maxFields_label,
                        value:
                            pleromaMetadataFieldsLimits.maxFields!.toString(),
                      ),
                    if (pleromaMetadataFieldsLimits.maxRemoteFields != null)
                      _SimpleInstanceDetailsRowWidget(
                        label: S
                            .of(context)
                            .app_instance_details_field_pleroma_metadata_fields_maxRemoteFields_label,
                        value: pleromaMetadataFieldsLimits.maxRemoteFields!
                            .toString(),
                      ),
                    if (pleromaMetadataFieldsLimits.nameLength != null)
                      _SimpleInstanceDetailsRowWidget(
                        label: S
                            .of(context)
                            .app_instance_details_field_pleroma_metadata_fields_nameLength_label,
                        value:
                            pleromaMetadataFieldsLimits.nameLength!.toString(),
                      ),
                    if (pleromaMetadataFieldsLimits.valueLength != null)
                      _SimpleInstanceDetailsRowWidget(
                        label: S
                            .of(context)
                            .app_instance_details_field_pleroma_metadata_fields_valueLength_label,
                        value:
                            pleromaMetadataFieldsLimits.valueLength!.toString(),
                      ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsPleromaMetadataPostFormatsWidget extends StatelessWidget {
  const _InstanceDetailsPleromaMetadataPostFormatsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<List<String>?>(
      stream: instanceDetailsBloc.pleromaMetadataPostFormatsStream,
      initialData: instanceDetailsBloc.pleromaMetadataPostFormats,
      builder: (context, snapshot) {
        var pleromaMetadataPostFormats = snapshot.data;

        if (pleromaMetadataPostFormats?.isNotEmpty == true) {
          return _SimpleInstanceDetailsRowWidget(
            label: S
                .of(context)
                .app_instance_details_field_pleroma_metadata_fields_postFormats_label,
            value: pleromaMetadataPostFormats?.join('\n').toString() ?? '',
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstanceDetailsVapidPublicKeyWidget extends StatelessWidget {
  const _InstanceDetailsVapidPublicKeyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceDetailsBloc = IInstanceDetailsBloc.of(context);

    return StreamBuilder<String?>(
      stream: instanceDetailsBloc.vapidPublicKeyStream,
      initialData: instanceDetailsBloc.vapidPublicKey,
      builder: (context, snapshot) {
        var vapidPublicKey = snapshot.data;

        if (vapidPublicKey?.isNotEmpty == true) {
          return _SimpleInstanceDetailsRowWidget(
            label:
                S.of(context).app_instance_details_field_vapidPublicKey_label,
            value: vapidPublicKey!.toString(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
