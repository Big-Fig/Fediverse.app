import 'package:fedi_app/app/access/register/form/stepper/register_access_form_stepper_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterAccessFormWidget extends StatelessWidget {
  final RegisterAccessCallback onRegister;

  const RegisterAccessFormWidget({
    required this.onRegister,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RegisterAccessFormStepperWidget(
        onRegister: onRegister,
      );
}
