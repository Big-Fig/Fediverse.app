import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomeTabStorageLocalPreferences
    implements ILocalPreferenceBloc<TimelinesHomeTabStorage> {
  static ITimelinesHomeTabStorageLocalPreferences of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelinesHomeTabStorageLocalPreferences>(context,
          listen: listen);
}
