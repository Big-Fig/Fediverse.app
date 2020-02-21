import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/application/pleroma_application_model.dart';
import 'package:fedi/Pleroma/content/pleroma_content_model.dart';
import 'package:fedi/Pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/Pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/Pleroma/field/pleroma_field_model.dart';
import 'package:fedi/Pleroma/source/pleroma_source_model.dart';
import 'package:fedi/Pleroma/relationship/pleroma_relationship_model.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/account/account_database_dao.dart';
import 'package:fedi/app/account/account_database_model.dart';
import 'package:fedi/app/status/database/status_database_dao.dart';
import 'package:fedi/app/status/database/status_database_model.dart';
import 'package:fedi/Pleroma/card/pleroma_card_model.dart';
import 'package:moor/moor.dart';
import 'package:fedi/app/moor/moor_converters.dart';

part 'app_database.g.dart';

@UseMoor(
  tables: [
    DbStatuses,
    DbAccounts,
  ],
  daos: [
    StatusDao,
    AccountDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
