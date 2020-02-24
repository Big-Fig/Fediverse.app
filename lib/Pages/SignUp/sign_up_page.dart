import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:fedi/Pages/SignUp/sign_up_bloc.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  
  final SignUpBloc bloc = SignUpBloc();
  final Function() instanceSuccess;

  SignUpPage(this.instanceSuccess);

  @override
  Widget build(BuildContext context) {
    bloc.instanceSuccess = instanceSuccess;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).tr("sign_up.title.sign_up"),
        ),
      ),
      body: ListView(
        children: <Widget>[
          userNameField(bloc),
          emailField(bloc),
          passwordField(bloc),
          confirmPasswordField(bloc),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(bloc),
          // getStatusWidget(bloc)
        ],
      ),
    );
  }

  Widget userNameField(SignUpBloc bloc) {
    return StreamBuilder(
      stream: bloc.username,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changeUsername,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)
                .tr("sign_up.fields.username.hint"),
              labelText: AppLocalizations.of(context)
                .tr("sign_up.fields.username.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget emailField(SignUpBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)
                .tr("sign_up.fields.email.hint"),
              labelText: AppLocalizations.of(context)
                .tr("sign_up.fields.email.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget passwordField(SignUpBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)
                .tr("sign_up.fields.password.hint"),
              labelText: AppLocalizations.of(context)
                .tr("sign_up.fields.password.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget confirmPasswordField(SignUpBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordsMatch,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: bloc.changeConfirmpassword,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)
                .tr("sign_up.fields.confirm_password.hint"),
              labelText: AppLocalizations.of(context)
                .tr("sign_up.fields.confirm_password.label"),
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget submitButton(SignUpBloc bloc) {
    return StreamBuilder(
      stream: bloc.register,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: RaisedButton(
            child: Text(AppLocalizations.of(context)
                .tr("sign_up.buttons.sign_up.text")),
            color: Colors.blue,
            onPressed: () {
              if (snapshot.hasData) {
                bloc.submit(context);
              } else {
                return null;
              }
            },
          ),
        );
      },
    );
  }
}
