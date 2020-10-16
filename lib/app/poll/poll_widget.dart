import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/async/async_operation_helper.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/date_time/date_time_dynamic_time_ago_widget.dart';
import 'package:fedi/mastodon/poll/mastodon_poll_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PollWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pollBloc = IPollBloc.of(context, listen: false);
    return Padding(
      padding: FediPadding.horizontalBigPadding,
      child: StreamBuilder<IPleromaPoll>(
          initialData: pollBloc.poll,
          stream: pollBloc.pollStream,
          builder: (context, snapshot) {
            var poll = snapshot.data;
            return Column(
              children: [
                ...poll.options.asMap().entries.map((entry) {
                  var index = entry.key;
                  var pollOption = entry.value;

                  var isOwnVote = poll.ownVotes?.contains(index) ?? false;

                  return Padding(
                    padding:
                        const EdgeInsets.only(top: FediSizes.mediumPadding),
                    child: InkWell(
                      onTap: poll.isPossibleToVote
                          ? () {
                              pollBloc.onPollOptionSelected(pollOption);
                              if (!poll.multiple) {
                                AsyncOperationHelper.performAsyncOperation(
                                  context: context,
                                  asyncCode: () async {
                                    await pollBloc.vote();
                                  },
                                );
                              }
                            }
                          : null,
                      child: PollOptionWidget(
                        index: index,
                        isPossibleToVote: poll.isPossibleToVote,
                        isOwnVote: isOwnVote,
                        pollOption: pollOption,
                        poll: poll,
                      ),
                    ),
                  );
                }).toList(),
                FediSmallVerticalSpacer(),
                if (pollBloc.multiple)
                  StreamBuilder<bool>(
                      stream: pollBloc.isPossibleToVoteStream,
                      initialData: pollBloc.isPossibleToVote,
                      builder: (context, snapshot) {
                        var isPossibleToVote = snapshot.data;

                        if (isPossibleToVote) {
                          return StreamBuilder<bool>(
                              stream: pollBloc.isVotedStream,
                              initialData: pollBloc.isVoted,
                              builder: (context, snapshot) {
                                var isSelectedVotesNotEmpty = snapshot.data;
                                return Padding(
                                  padding: FediPadding.allSmallPadding,
                                  child: AsyncOperationButtonBuilderWidget(
                                    builder: (context, onPressed) =>
                                        FediPrimaryFilledTextButton(
                                      "app.poll.vote".tr(),
                                      expanded: false,
                                      limitMinWidth: true,
                                      onPressed: isSelectedVotesNotEmpty
                                          ? onPressed
                                          : null,
                                    ),
                                    asyncButtonAction: () => pollBloc.vote(),
                                  ),
                                );
                              });
                        } else {
                          return SizedBox.shrink();
                        }
                      }),
                PollMetadataWidget(
                  poll: poll,
                ),
              ],
            );
          }),
    );
  }
}

class PollMetadataWidget extends StatelessWidget {
  final IPleromaPoll poll;

  PollMetadataWidget({
    @required this.poll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        PollMetadataTotalVotesCountWidget(
          votesCount: poll.votesCount,
        ),
        buildDotSeparatorWidget(),
        if (poll.expiresAt != null)
          PollMetadataExpiresAtWidget(
            expiresAt: poll.expiresAt,
            expired: poll.expired,
          ),
        if (poll.isPossibleToVote) buildDotSeparatorWidget(),
        if (poll.isPossibleToVote) PollMetadataShowHideResultsWidget()
      ],
    );
  }
}

Text buildDotSeparatorWidget() {
  return Text(
    " · ",
    style: FediTextStyles.mediumShortGrey,
  );
}

class PollMetadataTotalVotesCountWidget extends StatelessWidget {
  final int votesCount;

  PollMetadataTotalVotesCountWidget({@required this.votesCount});

  @override
  Widget build(BuildContext context) {
    return Text(
      "app.poll.metadata.total_votes".tr(args: [votesCount.toString()]),
      style: FediTextStyles.mediumShortGrey,
    );
  }
}

class PollMetadataShowHideResultsWidget extends StatelessWidget {
  PollMetadataShowHideResultsWidget();

  @override
  Widget build(BuildContext context) {
    var pollBloc = IPollBloc.of(context, listen: false);
    return StreamBuilder<bool>(
        stream: pollBloc.isNeedShowResultsWithoutVoteStream,
        initialData: pollBloc.isNeedShowResultsWithoutVote,
        builder: (context, snapshot) {
          var isNeedShowResultsWithoutVote = snapshot.data;
          return InkWell(
            onTap: () {
              if (isNeedShowResultsWithoutVote) {
                pollBloc.hideResultsWithoutVote();
              } else {
                pollBloc.showResultsWithoutVote();
              }
            },
            child: Text(
              isNeedShowResultsWithoutVote
                  ? "app.poll.metadata.hide_results".tr()
                  : "app.poll.metadata.show_results".tr(),
              style: FediTextStyles.mediumShortPrimary,
            ),
          );
        });
  }
}

class PollMetadataExpiresAtWidget extends StatelessWidget {
  final DateTime expiresAt;
  final bool expired;

  PollMetadataExpiresAtWidget({
    @required this.expiresAt,
    @required this.expired,
  });

  @override
  Widget build(BuildContext context) =>
      expired ? buildExpired() : buildNotExpired();

  Widget buildNotExpired() {
    return DateTimeDynamicTimeAgoWidget(
      dateTime: expiresAt,
      textStyle: FediTextStyles.mediumShortGrey,
      customTextBuilder: (String timeAgoString) {
        return "app.poll.metadata.expires.not_expired"
            .tr(args: [timeAgoString]);
      },
    );
  }

  Widget buildExpired() => Text(
        "app.poll.metadata.expires.expired".tr(),
        style: FediTextStyles.mediumShortGrey,
      );
}

class PollOptionWidget extends StatelessWidget {
  final IPleromaPoll poll;
  final bool isPossibleToVote;
  final int index;
  final bool isOwnVote;
  final IPleromaPollOption pollOption;

  PollOptionWidget({
    @required this.index,
    @required this.isPossibleToVote,
    @required this.isOwnVote,
    @required this.poll,
    @required this.pollOption,
  });

  @override
  Widget build(BuildContext context) {
    var pollBloc = IPollBloc.of(context, listen: false);

    var fillColor = isPossibleToVote
        ? FediColors.white
        : isOwnVote ? FediColors.primary : FediColors.ultraLightGrey;

    var backgroundColor = FediColors.white;

    // votes count can be hidden until poll ends
    var votesCount = pollOption.votesCount ?? 0;
    double votesPercent;
    if (votesCount == 0) {
      votesPercent = 0.0;
    } else {
      votesPercent = votesCount / poll.votesCount;
    }
    var borderRadius = BorderRadius.circular(8.0);
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: backgroundColor,
              border: Border.all(
                  color: isPossibleToVote
                      ? FediColors.primaryDark
                      : isOwnVote
                          ? FediColors.primaryDark
                          : FediColors.ultraLightGrey),
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth * votesPercent,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: fillColor,
                      ),
                    );
                  },
                ),
                _buildOptionContent(),
              ],
            ),
          ),
        ),
        if (pollBloc.multiple) _buildOptionSelection(pollBloc, borderRadius),
        StreamBuilder<Object>(
            stream: pollBloc.isNeedShowResultsWithoutVoteStream,
            initialData: pollBloc.isNeedShowResultsWithoutVote,
            builder: (context, snapshot) {
              var isNeedShowResultsWithoutVote = snapshot.data;

              if (!pollBloc.isPossibleToVote || isNeedShowResultsWithoutVote) {
                return PollOptionVotesPercentWidget(
                  votesPercent: votesPercent,
                  isOwnVote: isOwnVote,
                );
              } else {
                return SizedBox.shrink();
              }
            }),
      ],
    );
  }

  StreamBuilder<bool> _buildOptionSelection(
      IPollBloc pollBloc, BorderRadius borderRadius) {
    return StreamBuilder<bool>(
        stream: pollBloc.isPossibleToVoteStream,
        initialData: pollBloc.isPossibleToVote,
        builder: (context, snapshot) {
          var isPossibleToVote = snapshot.data;
          if (isPossibleToVote) {
            return StreamBuilder<List<IPleromaPollOption>>(
                stream: pollBloc.selectedVotesStream,
                initialData: pollBloc.selectedVotes,
                builder: (context, snapshot) {
                  var selectedVotes = snapshot.data;
                  var multiple = poll.multiple;

                  var isSelected = selectedVotes?.contains(pollOption) ?? false;
                  var borderColor =
                      isSelected ? FediColors.primary : FediColors.grey;
                  var backgroundColor =
                      isSelected ? FediColors.primary : FediColors.white;
                  var size = 28.0;
                  return Padding(
                    padding: const EdgeInsets.only(left: FediSizes.bigPadding),
                    child: Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: Border.all(
                          color: borderColor,
                        ),
                        borderRadius: multiple
                            ? borderRadius
                            : BorderRadius.circular(size / 2),
                      ),
                      child: isSelected
                          ? Center(
                              child: Icon(
                                FediIcons.check,
                                color: FediColors.white,
                                size: 16.0,
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                  );
                });
          } else {
            return SizedBox.shrink();
          }
        });
  }

  Padding _buildOptionContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: FediSizes.mediumPadding,
      ),
      child: Row(
        mainAxisAlignment: isPossibleToVote && !poll.multiple
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: <Widget>[
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: <Widget>[
          //     PollOptionVotesPercentWidget(votesPercent),
          //     FediSmallHorizontalSpacer(),
          //     PollOptionVotesCountWidget(votesCount),
          //     FediBigHorizontalSpacer(),
          //   ],
          // ),
          PollOptionTitleWidget(
            title: pollOption.title,
            isOwnVote: isOwnVote,
            isPossibleToVote: isPossibleToVote,
          ),
        ],
      ),
    );
  }
}

class PollOptionVotesCountWidget extends StatelessWidget {
  final int votesCount;

  PollOptionVotesCountWidget(this.votesCount);

  @override
  Widget build(BuildContext context) => Text(
        "(${votesCount.toString()})",
        style: FediTextStyles.mediumShortDarkGrey,
      );
}

class PollOptionVotesPercentWidget extends StatelessWidget {
  static final NumberFormat _format = NumberFormat("#%");

  final double votesPercent;
  final bool isOwnVote;

  PollOptionVotesPercentWidget({
    @required this.votesPercent,
    @required this.isOwnVote,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: 60,
        child: Center(
          child: Text(
            _format.format(votesPercent),
            style: isOwnVote
                ? FediTextStyles.bigTallPrimaryDark
                : FediTextStyles.bigTallGrey,
          ),
        ),
      );
}

class PollOptionTitleWidget extends StatelessWidget {
  final String title;
  final bool isPossibleToVote;
  final bool isOwnVote;

  PollOptionTitleWidget({
    @required this.title,
    @required this.isOwnVote,
    @required this.isPossibleToVote,
  });

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: isPossibleToVote
            ? FediTextStyles.bigTallPrimaryDark
            : isOwnVote
                ? FediTextStyles.bigTallWhite
                : FediTextStyles.bigTallGrey,
        overflow: TextOverflow.ellipsis,
      );
}
