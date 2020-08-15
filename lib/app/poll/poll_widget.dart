import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/mastodon/poll/mastodon_poll_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

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
                    padding: const EdgeInsets.only(top: FediSizes.smallPadding),
                    child: InkWell(
                      onTap: () {
                        pollBloc.onPollOptionSelected(pollOption);
                      },
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
                PollMetadataWidget(
                  poll: poll,
                ),
                StreamBuilder<bool>(
                    stream: pollBloc.isPossibleToVoteStream,
                    initialData: pollBloc.isPossibleToVote,
                    builder: (context, snapshot) {
                      var isPossibleToVote = snapshot.data;

                      if (isPossibleToVote) {
                        return StreamBuilder<bool>(
                            stream: pollBloc.isSelectedVotesNotEmptyStream,
                            initialData: pollBloc.isSelectedVotesNotEmpty,
                            builder: (context, snapshot) {
                              var isSelectedVotesNotEmpty = snapshot.data;
                              return Padding(
                                padding: FediPadding.allSmallPadding,
                                child: AsyncOperationButtonBuilderWidget(
                                  builder: (context, onPressed) =>
                                      FediPrimaryFilledTextButton(
                                    "app.poll.vote".tr(),
                                    expanded: false,
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PollMetadataTotalVotesCountWidget(
          votesCount: poll.votesCount,
        ),
        PollMetadataExpiresAtWidget(
          expiresAt: poll.expiresAt,
          expired: poll.expired,
        ),
      ],
    );
  }
}

class PollMetadataTotalVotesCountWidget extends StatelessWidget {
  final int votesCount;

  PollMetadataTotalVotesCountWidget({@required this.votesCount});

  @override
  Widget build(BuildContext context) {
    return Text(
      "app.poll.metadata.total_votes".tr(args: [votesCount.toString()]),
      style: FediTextStyles.mediumShortDarkGrey,
    );
  }
}

class PollMetadataExpiresAtWidget extends StatelessWidget {
  static final DateFormat expiresDateFormat = DateFormat('yyyy-MM-dd hh:mm');
  final DateTime expiresAt;
  final bool expired;

  PollMetadataExpiresAtWidget({
    @required this.expiresAt,
    @required this.expired,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      expired
          ? "app.poll.metadata.expires.expired"
              .tr(args: [timeago.format(expiresAt, locale: "en_short")])
          : "app.poll.metadata.expires.not_expired".tr(
              args: [
                expiresDateFormat.format(
                  expiresAt?.toLocal() ?? DateTime.now(),
                ),
              ],
            ),
      style: FediTextStyles.mediumShortDarkGrey,
    );
  }
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
        : isOwnVote ? FediColors.primaryColor : FediColors.ultraLightGrey;

    var backgroundColor = FediColors.white;

    // votes count can be hidden until poll ends
    var votesCount = pollOption.votesCount ?? 0;
    double votesPercent;
    if (votesCount == 0) {
      votesPercent = 0.0;
    } else {
      votesPercent = votesCount / poll.votesCount;
    }
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  fillColor,
                  fillColor,
                  backgroundColor,
                  backgroundColor
                ],
                stops: [0, votesPercent, votesPercent, 1],
              ),
              borderRadius: FediBorderRadius.allBigBorderRadius,
              border: Border.all(color: FediColors.ultraLightGrey),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: FediSizes.bigPadding,
                vertical: FediSizes.mediumPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      PollOptionVotesPercentWidget(votesPercent),
                      FediSmallHorizontalSpacer(),
                      PollOptionVotesCountWidget(votesCount),
                      FediBigHorizontalSpacer(),
                    ],
                  ),
                  PollOptionTitleWidget(pollOption.title),
                ],
              ),
            ),
          ),
        ),
        StreamBuilder<bool>(
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

                      var isSelected =
                          selectedVotes?.contains(pollOption) ?? false;
                      var color = isSelected
                          ? FediColors.primaryColor
                          : FediColors.ultraLightGrey;
                      var size = 35.0;
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: FediSizes.smallPadding),
                        child: Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: color,
                            ),
                            borderRadius: multiple
                                ? BorderRadius.zero
                                : BorderRadius.all(
                                    Radius.circular(size / 2),
                                  ),
                          ),
                          child: isSelected
                              ? Center(
                                  child: Icon(
                                    FediIcons.check,
                                    color: color,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ),
                      );
                    });
              } else {
                return SizedBox.shrink();
              }
            }),
      ],
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

  PollOptionVotesPercentWidget(this.votesPercent);

  @override
  Widget build(BuildContext context) => Container(
        width: 40,
        child: Center(
          child: Text(
            _format.format(votesPercent),
            style: FediTextStyles.mediumShortDarkGrey,
          ),
        ),
      );
}

class PollOptionTitleWidget extends StatelessWidget {
  final String title;

  PollOptionTitleWidget(this.title);

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: FediTextStyles.mediumShortDarkGrey,
        overflow: TextOverflow.ellipsis,
      );
}
