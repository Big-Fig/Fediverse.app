import 'package:fedi_app/app/chat/conversation/share/conversation_chat_share_entity_bloc_impl.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/share/entity/settings/share_entity_settings_bloc_impl.dart';
import 'package:fedi_app/app/share/entity/settings/share_entity_settings_widget.dart';
import 'package:fedi_app/app/share/entity/share_entity_model.dart';
import 'package:fedi_app/app/share/entity/share_entity_widget.dart';
import 'package:fedi_app/app/share/select_account/share_select_account_widget.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationChatShareEntityPage extends StatelessWidget {
  const ConversationChatShareEntityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_chat_conversation_share_title,
        ),
        body: const ShareSelectAccountWidget(
          header: ShareEntityWidget(
            footer: ShareEntitySettingsWidget(),
          ),
          alwaysShowHeader: true,
        ),
      );
}

void goToConversationChatShareEntityPage({
  required BuildContext context,
  required ShareEntity shareEntity,
  required InstanceLocation instanceLocation,
}) {
  Navigator.push(
    context,
    createConversationChatShareEntityPageRoute(
      context: context,
      shareEntity: shareEntity,
      instanceLocation: instanceLocation,
    ),
  );
}

MaterialPageRoute<void> createConversationChatShareEntityPageRoute({
  required BuildContext context,
  required ShareEntity shareEntity,
  required InstanceLocation instanceLocation,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => ShareEntitySettingsBloc.provideToContext(
        context,
        shareEntity: shareEntity,
        child: ConversationChatShareEntityBloc.provideToContext(
          context,
          shareEntity: shareEntity,
          child: Provider<ShareEntity>.value(
            value: shareEntity,
            child: const ConversationChatShareEntityPage(),
          ),
        ),
      ),
    );
