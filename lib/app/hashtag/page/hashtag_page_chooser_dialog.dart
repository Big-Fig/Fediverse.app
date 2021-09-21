import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/page/local/local_hashtag_page.dart';
import 'package:fedi/app/hashtag/page/remote/remote_hashtag_page.dart';
import 'package:fedi/app/ui/dialog/actions/fedi_actions_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:fediverse_api/fediverse_api.dart';

Future showHashtagPageChooserDialog({
  required BuildContext context,
  required Uri remoteInstanceUri,
  required IHashtag hashtag,
}) async {
  var currentUnifediApiAccessBloc = ICurrentUnifediApiAccessBloc.of(
    context,
    listen: false,
  );
  var currentInstance = currentUnifediApiAccessBloc.currentInstance;

  if (currentInstance != null) {
    var localInstanceDomain = currentInstance.urlHost;

    return FediActionsDialog(
      context: context,
      title:
          S.of(context).app_hashtag_remoteInstance_dialog_title(hashtag.name),
      actions: [
        DialogAction(
          label: S
              .of(context)
              .app_hashtag_remoteInstance_dialog_action_openOnLocal(
                localInstanceDomain,
              ),
          onAction: (context) {
            Navigator.of(context).pop();
            goToLocalHashtagPage(
              context: context,
              hashtag: hashtag,
              myAccountFeaturedHashtag: null,
            );
          },
        ),
        DialogAction(
          label: S
              .of(context)
              .app_hashtag_remoteInstance_dialog_action_openOnRemote(
                remoteInstanceUri.host,
              ),
          onAction: (_) {
            // don't use context from this action we need parent context
            Navigator.of(context).pop();
            goToRemoteHashtagPage(
              context,
              hashtag: hashtag,
              remoteInstanceUri: remoteInstanceUri,
            );
          },
        ),
      ],
    ).show(context);
  } else {
    await goToRemoteHashtagPage(
      context,
      hashtag: hashtag,
      remoteInstanceUri: remoteInstanceUri,
    );
  }
}
