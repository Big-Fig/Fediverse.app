import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleFediSelectionItemRowWidget extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  const SimpleFediSelectionItemRowWidget({
    Key? key,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onClick,
        child: FediSelectionItemRowWidget(
          leading: null,
          ending: FediSelectionItemIconWidget(
            onClick: onClick,
          ),
          title: SimpleFediSelectionItemRowTitleWidget(
            title: title,
          ),
        ),
      );
}

class SimpleFediSelectionItemRowTitleWidget extends StatelessWidget {
  const SimpleFediSelectionItemRowTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.allSmallPadding,
        child: Text(
          title,
          style: IFediUiTextTheme.of(context).bigTallMediumGrey,
        ),
      );
}

class FediSelectionItemRowWidget extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  final Widget? ending;

  const FediSelectionItemRowWidget({
    Key? key,
    required this.title,
    required this.leading,
    required this.ending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        // todo: refactor
        // ignore: no-magic-number
        height: 24.0 + 16.0 + 16.0,
        child: Padding(
          padding: FediPadding.horizontalBigPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  title,
                ],
              ),
              if (ending != null) ending!,
            ],
          ),
        ),
      );
}

class FediSelectionItemIconWidget extends StatelessWidget {
  const FediSelectionItemIconWidget({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onClick,
        child: Icon(
          FediIcons.chevron_right,
          color: IFediUiColorTheme.of(context).darkGrey,
          // ignore: no-magic-number
          size: 14.0,
        ),
      );
}
