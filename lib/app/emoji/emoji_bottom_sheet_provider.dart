

import 'package:fedi/app/emoji/emoji_bottom_sheet_bloc.dart';
import 'package:flutter/material.dart';

class EmojiBottomSheetProvider extends InheritedWidget {
  final  EmojiBottomSheetBloc bloc;
  EmojiBottomSheetProvider(this.bloc, {Key key, Widget child}) : super(key: key, child: child);

  
  bool updateShouldNotify(_) => false;
  
  static EmojiBottomSheetProvider of(BuildContext context) {
    return ( context.dependOnInheritedWidgetOfExactType<EmojiBottomSheetProvider>() );
  }
}