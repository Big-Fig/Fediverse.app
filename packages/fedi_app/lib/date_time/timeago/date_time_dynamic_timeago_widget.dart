import 'dart:async';

import 'package:fedi_app/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi_app/localization/localization_model.dart';
import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;

typedef DateTimeAgoTextBuilder = String Function(String timeAgoString);

class DateTimeDynamicTimeagoWidget extends StatefulWidget {
  final DateTime dateTime;
  final TextStyle textStyle;
  final DateTimeAgoTextBuilder? customTextBuilder;

  const DateTimeDynamicTimeagoWidget({
    Key? key,
    required this.dateTime,
    required this.textStyle,
    this.customTextBuilder,
  }) : super(key: key);

  @override
  DateTimeDynamicTimeagoWidgetState createState() =>
      DateTimeDynamicTimeagoWidgetState();
}

class DateTimeDynamicTimeagoWidgetState
    extends State<DateTimeDynamicTimeagoWidget> {
  Timer? timer;
  bool disposed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // ignore: no-magic-number
    const secondsInMinute = 60;
    var timeToFirstUpdate = secondsInMinute - widget.dateTime.second;
    // synchronize redraw at 00 seconds for each minute
    Future.delayed(
      Duration(seconds: timeToFirstUpdate),
      () {
        if (!disposed) {
          timer = Timer.periodic(
            const Duration(seconds: secondsInMinute),
            (_) {
              // redraw timeago each minute
              // todo: rework with stateless widget
              // ignore: no-empty-block
              setState(() {});
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var localizationSettingsBloc = ILocalizationSettingsBloc.of(context);

    return StreamBuilder<LocalizationLocale?>(
      stream: localizationSettingsBloc.localizationLocaleStream,
      initialData: localizationSettingsBloc.localizationLocale,
      builder: (context, snapshot) {
        var localizationLocale = snapshot.data;

        localizationLocale = LocalizationLocale
            .calculateLocaleBaseOnLocalizationLocaleOrPlatformLocale(
          localizationLocale: localizationLocale,
        );

        var languageCode = localizationLocale.languageCode.toLowerCase();

        String locale;

        switch (languageCode) {
          // short not implemented yet
          case 'pl':
            locale = languageCode;
            break;

          default:
            locale = languageCode + '_short';
            break;
        }
        var timeAgoString = timeago.format(
          widget.dateTime,
          locale: locale,
          allowFromNow: true,
        );

        return Text(
          widget.customTextBuilder != null
              ? widget.customTextBuilder!(timeAgoString)
              : timeAgoString,
          style: widget.textStyle,
        );
      },
    );
  }
}
