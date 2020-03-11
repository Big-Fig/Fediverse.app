

import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fedi/Pleroma/Models/emoji_reaction.dart';

part 'status_pleroma.g.dart';

@JsonSerializable(includeIfNull: false)
class StatusPleroma {
    Content content;
    @JsonKey(name: "conversation_id")
    int conversationId;
    @JsonKey(name: "direct_converstaion_id")
    dynamic directConversationId;
    @JsonKey(name: "emoji_reactions")
    List<EmojiReaction> emojiReactions;
    @JsonKey(name: "expires_at")
    dynamic expiresAt;
    @JsonKey(name: "in_reply_to_account_acct")
    dynamic inReplyToAccountAcct;
    bool local;
    @JsonKey(name: "spoiler_text")
    Content spoilerText;
    @JsonKey(name: "thread_muted")
    bool threadMuted;

    StatusPleroma({
        this.content,
        this.conversationId,
        this.directConversationId,
        this.emojiReactions,
        this.expiresAt,
        this.inReplyToAccountAcct,
        this.local,
        this.spoilerText,
        this.threadMuted,
    });


  factory StatusPleroma.fromJson(Map<String, dynamic> json) =>
      _$StatusPleromaFromJson(json);

  Map<String, dynamic> toJson() => _$StatusPleromaToJson(this);

    
}

