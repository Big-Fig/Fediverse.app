import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class RegisterAccessFormStepperItemDescriptionWidget extends StatelessWidget {
  final String text;

  const RegisterAccessFormStepperItemDescriptionWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: IFediUiTextTheme.of(context).bigTallDarkGrey,
      );
}
