import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:fedi/app/emoji/emoji_bottom_sheet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:emoji_picker/emoji_picker.dart' as EmojiWidget;
import 'package:shared_preferences/shared_preferences.dart';
import "dart:collection";


class EmojiBottomPicker extends StatelessWidget {

  final EmojiBottomSheetBloc emojiBloc;
  EmojiBottomPicker({this.emojiBloc});


  @override
  Widget build(BuildContext context) {
    print("BUILDING");

    return BottomSheet(
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(flex: 2,),
                  Text(
                   AppLocalizations.of(context)
                .tr("emoji_reation.title"),
                    style: TextStyle(color: Colors.black54),
                  ),
                   Spacer(flex: 1,),
                  FlatButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();

                    },
                  ),
                ],
              ),
              EmojiWidget.EmojiPicker(
                bgColor: Colors.transparent,
                rows: 3,
                columns: 7,
                numRecommended: 0,
                selectedCategory: EmojiWidget.Category.RECENT,
                recommendKeywords: null,
                buttonMode: EmojiWidget.ButtonMode.MATERIAL,
                onEmojiSelected: (emoji, category) {
                  print(emoji.emoji);
                  emojiBloc.addRemoveReaction(emoji.emoji);
                  SharedPreferences.getInstance().then((prefs) {
                    final key = "recents";
                    var recentEmojis =
                        prefs.getStringList(key) ?? new List();
                    recentEmojis.insert(0, emoji.name);
                    // remove any duplicates;
                    List<String> emojis = LinkedHashSet<String>.from(recentEmojis).toList();
                    prefs.setStringList(key, emojis);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
      onClosing: () {},
    );
  }
}
