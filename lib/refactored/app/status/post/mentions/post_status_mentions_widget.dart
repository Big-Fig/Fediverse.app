import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/select/select_account_page.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusMentionsWidget extends StatefulWidget {
  @override
  _PostStatusMentionsWidgetState createState() =>
      _PostStatusMentionsWidgetState();
}

class _PostStatusMentionsWidgetState extends State<PostStatusMentionsWidget> {
  bool mentionsExpanded = false;

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: true);

    return Column(mainAxisSize: MainAxisSize.min, children: [
      InitialDataStreamBuilder<List<String>>(
          stream: postStatusBloc.mentionedAcctsStream,
          initialData: postStatusBloc.mentionedAccts,
          builder: (context, snapshot) {
            var mentionedAccts = snapshot.data;
            return Visibility(
              visible: mentionedAccts.isNotEmpty == true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(child: Container()),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: OutlineButton(
                        color: Colors.blue,
                        child: buildMentionedAcctsDesc(context, mentionedAccts),
                        onPressed: () {
                          toggleMentionExpanded(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
      InitialDataStreamBuilder<List<String>>(
          stream: postStatusBloc.mentionedAcctsStream,
          initialData: postStatusBloc.mentionedAccts,
          builder: (context, snapshot) {
            var mentionedAccts = snapshot.data;

            return AnimatedContainer(
              duration: Duration(milliseconds: 275),
              height: mentionsExpanded && mentionedAccts.isNotEmpty ? 130 : 0,
              curve: Curves.bounceInOut,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: mentionedAccts.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == mentionedAccts.length) {
                    return buildAddMentionButton(context, postStatusBloc);
                  } else {
                    String acct = mentionedAccts[index];
                    return buildMentionedAcctRow(postStatusBloc, acct);
                  }
                },
              ),
            );
          })
    ]);
  }

  Container buildMentionedAcctRow(IPostStatusBloc postStatusBloc, String acct) {
    return Container(
      height: 55,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.remove_circle_outline,
              color: Colors.red,
            ),
            onPressed: () {
              postStatusBloc.removeMentionByAcct(acct);
            },
          ),
          Text("@$acct"),
        ],
      ),
    );
  }

  Card buildAddMentionButton(
      BuildContext context, IPostStatusBloc postStatusBloc) {
    return Card(
      child: FlatButton(
        child: Text(
          " + @ ",
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: () {
          goToSelectAccountPage(context, excludeMyAccount: true,
              accountSelectedCallback: (account) {
            postStatusBloc.addMentionByAccount(account);
            Navigator.of(context).pop();
          });
        },
      ),
    );
  }

  Text buildMentionedAcctsDesc(
      BuildContext context, List<String> mentionedAccts) {
    String mentionDesc;
    if (mentionedAccts.length > 1) {
      mentionDesc = AppLocalizations.of(context).tr(
          "app.status.post.mention.content.many",
          args: [mentionedAccts.length.toString()]);
    } else {
      mentionDesc = AppLocalizations.of(context)
          .tr("app.status.post.mention.content.one");
    }

    return Text(
      '@ $mentionDesc',
      style: TextStyle(color: Colors.blue),
    );
  }

  void toggleMentionExpanded(BuildContext context) {
    if (!mentionsExpanded) {
      FocusScope.of(context).unfocus();
      setState(() {
        mentionsExpanded = true;
      });
    } else {
      setState(() {
        mentionsExpanded = false;
      });
    }
  }
}
