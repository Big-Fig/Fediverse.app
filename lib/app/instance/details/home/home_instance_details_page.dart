import 'package:fedi/app/instance/details/home/home_instance_details_bloc_impl.dart';
import 'package:fedi/app/instance/details/instance_details_app_bar_widget.dart';
import 'package:fedi/app/instance/details/instance_details_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeInstanceDetailsPage extends StatelessWidget {
  const HomeInstanceDetailsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstanceDetailsPageAppBarWidget(),
      body: const SafeArea(
        child: InstanceDetailsWidget(),
      ),
    );
  }
}

MaterialPageRoute createHomeInstanceDetailsPageRoute() => MaterialPageRoute(
      builder: (context) => HomeInstanceDetailsBloc.provideToContext(
        context,
        child: const HomeInstanceDetailsPage(),
      ),
    );

void goToHomeInstanceDetailsPage(BuildContext context) {
  Navigator.push(
    context,
    createHomeInstanceDetailsPageRoute(),
  );
}
