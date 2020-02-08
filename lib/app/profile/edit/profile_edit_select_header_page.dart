import 'package:fedi/app/profile/edit/profile_edit_select_image_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileEditSelectHeaderPage extends ProfileEditSelectImagePage {
  ProfileEditSelectHeaderPage(
      {@required ImageFileSelectedCallback selectedCallback})
      : super(selectedCallback: selectedCallback);

  @override
  Widget createAppBarTitle(BuildContext context) {
    return Text("Select header");
  }
}
