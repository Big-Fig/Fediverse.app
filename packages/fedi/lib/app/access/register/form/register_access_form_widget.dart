import 'package:fedi/app/access/register/form/stepper/register_access_form_stepper_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterUnifediApiAccessFormWidget extends StatelessWidget {
  final RegisterCallback onRegister;

  const RegisterUnifediApiAccessFormWidget({
    required this.onRegister,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      RegisterUnifediApiAccessFormStepperWidget(
        onRegister: onRegister,
      );
}
