import 'dart:convert';

import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:fedi/Pages/SignUp/sign_up_bloc.dart';
import 'package:fedi/Pleroma/Models/captcha.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpBloc bloc = SignUpBloc();

  @override
  Widget build(BuildContext context) {
    bloc.fetchCaptcha();
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
          getCaptchaField(bloc),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget getCaptchaField(SignUpBloc bloc) {
    return StreamBuilder(
      stream: bloc.captcha,
      builder: (context, AsyncSnapshot<Captcha> snapshot) {
        Widget image = Container(
          height: 100,
          child: Center(
            child: Container(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
          ),
        );
        if (snapshot.hasData) {
          image = Stack(
            children: <Widget>[
              Container(
                height: 100,
                child: Center(
                  child: Image.memory(
                    base64Decode(snapshot.data.url.split(',').last),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  bloc.fetchCaptcha();
                },
              )
            ],
          );
        }

        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              image,
              TextField(
                onChanged: bloc.changeCaptch,
                decoration: InputDecoration(
                  hintText: 'Captcha',
                  labelText: 'Captcha',
                  errorText: snapshot.error,
                ),
              ),
            ],
          ),
        );
      },
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
              hintText: 'e.g. lain',
              labelText: 'Username',
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
              hintText: 'you@example.com',
              labelText: 'Email Address',
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
              hintText: 'Password',
              labelText: 'Password',
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
              hintText: 'Password confimation',
              labelText: 'Password confimation',
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
