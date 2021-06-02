import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/hashtag/hashtag_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/page/hashtag_page_bloc.dart';
import 'package:fedi/app/hashtag/page/local/local_hashtag_page.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_dialog.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HashtagPageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const HashtagPageAppBarWidget();

  @override
  Widget build(BuildContext context) {
    var hashtag = Provider.of<IHashtag>(context);

    String title;

    var hashtagPageBloc = IHashtagPageBloc.of(context);
    var isLocal = hashtagPageBloc.instanceLocation == InstanceLocation.local;

    if (isLocal) {
      title = '#${hashtag.name}';
    } else {
      var remoteInstanceUriOrNull = hashtagPageBloc.remoteInstanceUriOrNull!;
      var host = remoteInstanceUriOrNull.host;
      title = '#${hashtag.name}@$host';
    }

    return FediPageTitleAppBar(
      centerTitle: false,
      title: title,
      actions: <Widget>[
        if (!isLocal) const _HashtagPageAppBarSearchOnLocalInstanceAction(),
        if (isLocal) const _HashtagPageAppBarFeaturedAction(),
        const _HashtagPageAppBarSettingsActionWidget(),
        const _HashtagPageAppBarOpenInBrowserAction(),
      ],
    );
  }

  @override
  Size get preferredSize => FediPageTitleAppBar.calculatePreferredSize();
}

class _HashtagPageAppBarOpenInBrowserAction extends StatelessWidget {
  const _HashtagPageAppBarOpenInBrowserAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hashtag = Provider.of<IHashtag>(context);

    return FediIconButton(
      color: IFediUiColorTheme.of(context).darkGrey,
      icon: Icon(FediIcons.external_icon),
      onPressed: () {
        UrlHelper.handleUrlClickOnLocalInstanceLocation(
          context: context,
          url: hashtag.url,
        );
      },
    );
  }
}

class _HashtagPageAppBarFeaturedAction extends StatelessWidget {
  const _HashtagPageAppBarFeaturedAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hashtagBloc = Provider.of<IHashtagBloc>(context);

    var isInstanceSupportFeaturedTags =
        hashtagBloc.isInstanceSupportFeaturedTags;

    if (isInstanceSupportFeaturedTags) {
      return StreamBuilder<bool>(
        stream: hashtagBloc.isLoadingFeaturedHashtagStateStream,
        initialData: hashtagBloc.isLoadingFeaturedHashtagState,
        builder: (context, snapshot) {
          var isLoadingFeaturedHashtagState = snapshot.data!;

          return StreamBuilder<bool>(
            stream: hashtagBloc.featuredStream,
            initialData: hashtagBloc.featured,
            builder: (context, snapshot) {
              var featured = snapshot.data!;

              return AsyncOperationButtonBuilderWidget(
                builder: (context, onPressed) => FediIconButton(
                  color: IFediUiColorTheme.of(context).darkGrey,
                  icon: Icon(
                    featured ? FediIcons.heart_active : FediIcons.heart,
                  ),
                  onPressed: isLoadingFeaturedHashtagState ? null : onPressed,
                ),
                asyncButtonAction: () async {
                  if (featured) {
                    await hashtagBloc.unFeature();
                  } else {
                    await hashtagBloc.feature();
                  }
                },
              );
            },
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _HashtagPageAppBarSearchOnLocalInstanceAction extends StatelessWidget {
  const _HashtagPageAppBarSearchOnLocalInstanceAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hashtag = Provider.of<IHashtag>(context);

    return FediIconButton(
      color: IFediUiColorTheme.of(context).darkGrey,
      icon: Icon(
        FediIcons.instance,
      ),
      onPressed: () {
        goToLocalHashtagPage(
          context: context,
          hashtag: hashtag,
          myAccountFeaturedHashtag: null,
        );
      },
    );
  }
}

class _HashtagPageAppBarSettingsActionWidget extends StatelessWidget {
  const _HashtagPageAppBarSettingsActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hashtagPageBloc = IHashtagPageBloc.of(context);
    var instanceLocation = hashtagPageBloc.instanceLocation;

    return FediIconButton(
      icon: Icon(
        FediIcons.settings,
        color: IFediUiColorTheme.of(context).darkGrey,
      ),
      onPressed: () {
        var timelineLocalPreferenceBloc = ITimelineLocalPreferenceBloc.of(
          context,
          listen: false,
        );
        var timeline = timelineLocalPreferenceBloc.value!;
        var hashtag = Provider.of<IHashtag>(
          context,
          listen: false,
        );
        showEditTimelineLocalPreferenceBlocSettingsDialog(
          context: context,
          instanceLocation: instanceLocation,
          timelineLocalPreferenceBloc: timelineLocalPreferenceBloc,
          timeline: Timeline.byType(
            id: timeline.id,
            isPossibleToDelete: false,
            label: hashtag.name,
            type: TimelineType.hashtag,
            settings: timeline.settings,
          ),
          lockedSource: true,
          pleromaApiInstance:
              Provider.of<IPleromaApiInstance>(context, listen: false),
        );
      },
    );
  }
}
