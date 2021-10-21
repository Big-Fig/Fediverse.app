import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/async/async_operation_helper.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/date_time/timeago/date_time_dynamic_timeago_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class PollWidget extends StatelessWidget {
  const PollWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollBloc = IPollBloc.of(context);

    return Padding(
      padding: FediPadding.horizontalBigPadding,
      child: StreamBuilder<IUnifediApiPoll>(
        initialData: pollBloc.poll,
        stream: pollBloc.pollStream,
        builder: (context, snapshot) {
          var poll = snapshot.data!;

          return Provider<IUnifediApiPoll>.value(
            value: poll,
            child: const _PollBodyWidget(),
          );
        },
      ),
    );
  }
}

class _PollBodyWidget extends StatelessWidget {
  const _PollBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollBloc = IPollBloc.of(context);
    var poll = Provider.of<IUnifediApiPoll>(context);

    return Column(
      children: [
        ...poll.options
            .map(
              (pollOption) => Provider<IUnifediApiPollOption>.value(
                value: pollOption,
                child: const _PollBodyOptionWidget(),
              ),
            )
            .toList(),
        const FediSmallVerticalSpacer(),
        if (pollBloc.multiple) const _PollBodyVoteButtonBuilderWidget(),
        const PollMetadataWidget(),
      ],
    );
  }
}

class _PollBodyVoteButtonBuilderWidget extends StatelessWidget {
  const _PollBodyVoteButtonBuilderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollBloc = IPollBloc.of(context);

    return StreamBuilder<bool>(
      stream: pollBloc.isPossibleToVoteStream,
      builder: (context, snapshot) {
        var isPossibleToVote = snapshot.data ?? false;

        if (isPossibleToVote) {
          return StreamBuilder<bool>(
            stream: pollBloc.isVotedStream,
            builder: (context, snapshot) {
              var isSelectedVotesNotEmpty = snapshot.data ?? false;

              return Padding(
                padding: FediPadding.allSmallPadding,
                child: AsyncOperationButtonBuilderWidget<void>(
                  builder: (context, onPressed) =>
                      FediPrimaryFilledTextButtonWithBorder(
                    S.of(context).app_poll_vote,
                    expanded: false,
                    limitMinWidth: true,
                    onPressed: isSelectedVotesNotEmpty ? onPressed : null,
                  ),
                  asyncButtonAction: () => pollBloc.vote(),
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _PollBodyOptionWidget extends StatelessWidget {
  const _PollBodyOptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollBloc = IPollBloc.of(context);
    var poll = Provider.of<IUnifediApiPoll>(context);
    var pollOption = Provider.of<IUnifediApiPollOption>(context);

    return Padding(
      padding: const EdgeInsets.only(top: FediSizes.mediumPadding),
      child: InkWell(
        onTap: poll.isPossibleToVote
            ? () {
                pollBloc.onPollOptionSelected(pollOption);
                if (!poll.multiple) {
                  // ignore: avoid-ignoring-return-values
                  AsyncOperationHelper.performAsyncOperation(
                    context: context,
                    asyncCode: () => pollBloc.vote(),
                  );
                }
              }
            : null,
        child: const PollOptionWidget(),
      ),
    );
  }
}

class PollMetadataWidget extends StatelessWidget {
  const PollMetadataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var poll = Provider.of<IUnifediApiPoll>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const PollMetadataTotalVotesCountWidget(),
        const _PollMetadataDotSeparatorWidget(),
        const PollMetadataExpiresAtWidget(),
        if (poll.isPossibleToVote) const _PollMetadataDotSeparatorWidget(),
        if (poll.isPossibleToVote) const PollMetadataShowHideResultsWidget(),
      ],
    );
  }
}

class _PollMetadataDotSeparatorWidget extends StatelessWidget {
  const _PollMetadataDotSeparatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        ' · ',
        style: IFediUiTextTheme.of(context).mediumShortGrey,
      );
}

class PollMetadataTotalVotesCountWidget extends StatelessWidget {
  const PollMetadataTotalVotesCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var poll = Provider.of<IUnifediApiPoll>(context);

    return Text(
      S.of(context).app_poll_metadata_totalVotes(poll.votesCount ?? 0),
      style: IFediUiTextTheme.of(context).mediumShortGrey,
    );
  }
}

class PollMetadataShowHideResultsWidget extends StatelessWidget {
  const PollMetadataShowHideResultsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollBloc = IPollBloc.of(context);

    return StreamBuilder<bool>(
      stream: pollBloc.isNeedShowResultsWithoutVoteStream,
      initialData: pollBloc.isNeedShowResultsWithoutVote,
      builder: (context, snapshot) {
        var isNeedShowResultsWithoutVote = snapshot.data!;

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
                ? S.of(context).app_poll_metadata_hideResults
                : S.of(context).app_poll_metadata_showResults,
            style: IFediUiTextTheme.of(context).mediumShortPrimary,
          ),
        );
      },
    );
  }
}

class PollMetadataExpiresAtWidget extends StatelessWidget {
  const PollMetadataExpiresAtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var poll = Provider.of<IUnifediApiPoll>(context);

    return poll.expired
        ? const _PollMetadataExpiresAtExpiredWidget()
        : const _PollMetadataExpiresAtNotExpiredWidget();
  }
}

class _PollMetadataExpiresAtExpiredWidget extends StatelessWidget {
  const _PollMetadataExpiresAtExpiredWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        S.of(context).app_poll_metadata_expires_expired,
        style: IFediUiTextTheme.of(context).mediumShortGrey,
      );
}

class _PollMetadataExpiresAtNotExpiredWidget extends StatelessWidget {
  const _PollMetadataExpiresAtNotExpiredWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var poll = Provider.of<IUnifediApiPoll>(context);

    var expiresAt = poll.expiresAt;
    if (expiresAt != null) {
      return DateTimeDynamicTimeagoWidget(
        dateTime: expiresAt,
        textStyle: IFediUiTextTheme.of(context).mediumShortGrey,
        customTextBuilder: (String timeAgoString) =>
            S.of(context).app_poll_metadata_expires_notExpired(timeAgoString),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

// todo: refactor
// ignore: no-magic-number
const borderRadius = BorderRadius.all(Radius.circular(8.0));

class PollOptionWidget extends StatelessWidget {
  const PollOptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollBloc = IPollBloc.of(context);

    return Row(
      children: <Widget>[
        const Expanded(
          child: _PollOptionBodyWidget(),
        ),
        if (pollBloc.multiple) const _PollOptionSelectionWidget(),
        const _PollOptionResultsWidget(),
      ],
    );
  }
}

class _PollOptionBodyWidget extends StatelessWidget {
  const _PollOptionBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backgroundColor = IFediUiColorTheme.of(context).white;
    var poll = Provider.of<IUnifediApiPoll>(context);
    var pollOption = Provider.of<IUnifediApiPollOption>(context);

    var isOwnVote = poll.isOwnVote(pollOption);

    return Container(
      // todo: refactor
      // ignore: no-magic-number
      height: 40,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: backgroundColor,
        border: Border.all(
          color: poll.isPossibleToVote
              ? IFediUiColorTheme.of(context).primaryDark
              : isOwnVote
                  ? IFediUiColorTheme.of(context).primaryDark
                  : IFediUiColorTheme.of(context).ultraLightGrey,
        ),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: const [
          _PollOptionBodyFillerWidget(),
          _PollOptionContentWidget(),
        ],
      ),
    );
  }
}

class _PollOptionBodyFillerWidget extends StatelessWidget {
  const _PollOptionBodyFillerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var poll = Provider.of<IUnifediApiPoll>(context);
    var pollOption = Provider.of<IUnifediApiPollOption>(context);

    var isOwnVote = poll.isOwnVote(pollOption);

    var fillColor = poll.isPossibleToVote
        ? IFediUiColorTheme.of(context).white
        : isOwnVote
            ? IFediUiColorTheme.of(context).primary
            : IFediUiColorTheme.of(context).ultraLightGrey;
    var votesPercent = poll.votesPercent(pollOption);

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: constraints.maxWidth * votesPercent,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: fillColor,
        ),
      ),
    );
  }
}

class _PollOptionResultsWidget extends StatelessWidget {
  const _PollOptionResultsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollBloc = IPollBloc.of(context);

    return StreamBuilder<bool>(
      stream: pollBloc.isNeedShowResultsWithoutVoteStream,
      initialData: pollBloc.isNeedShowResultsWithoutVote,
      builder: (context, snapshot) {
        var isNeedShowResultsWithoutVote = snapshot.data;

        if (!pollBloc.isPossibleToVote || isNeedShowResultsWithoutVote!) {
          return const PollOptionVotesPercentWidget();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _PollOptionSelectionWidget extends StatelessWidget {
  const _PollOptionSelectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollBloc = IPollBloc.of(context);
    var poll = Provider.of<IUnifediApiPoll>(context);
    var pollOption = Provider.of<IUnifediApiPollOption>(context);

    return StreamBuilder<bool>(
      stream: pollBloc.isPossibleToVoteStream,
      initialData: pollBloc.isPossibleToVote,
      builder: (context, snapshot) {
        var isPossibleToVote = snapshot.data!;
        if (isPossibleToVote) {
          return StreamBuilder<List<IUnifediApiPollOption>?>(
            stream: pollBloc.selectedVotesStream,
            initialData: pollBloc.selectedVotes,
            builder: (context, snapshot) {
              var selectedVotes = snapshot.data!;
              var multiple = poll.multiple;

              var isSelected = selectedVotes.contains(pollOption);
              var borderColor = isSelected
                  ? IFediUiColorTheme.of(context).primary
                  : IFediUiColorTheme.of(context).grey;
              var backgroundColor = isSelected
                  ? IFediUiColorTheme.of(context).primary
                  : IFediUiColorTheme.of(context).white;
              // todo: refactor
              // ignore: no-magic-number
              var size = 28.0;

              return Padding(
                padding: const EdgeInsets.only(left: FediSizes.bigPadding),
                child: Container(
                  width: size,
                  // ignore: no-equal-arguments
                  height: size,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    border: Border.all(
                      color: borderColor,
                    ),
                    borderRadius: multiple
                        ? borderRadius
                        // ignore: no-magic-number
                        : BorderRadius.circular(size / 2),
                  ),
                  child: isSelected
                      ? Center(
                          child: Icon(
                            FediIcons.check,
                            color: IFediUiColorTheme.of(context).white,
                            // todo: refactor
                            // ignore: no-magic-number
                            size: 16.0,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _PollOptionContentWidget extends StatelessWidget {
  const _PollOptionContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var poll = Provider.of<IUnifediApiPoll>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: FediSizes.mediumPadding,
      ),
      child: Row(
        mainAxisAlignment: poll.isPossibleToVote && !poll.multiple
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: const <Widget>[
          PollOptionTitleWidget(),
        ],
      ),
    );
  }
}

class PollOptionVotesCountWidget extends StatelessWidget {
  const PollOptionVotesCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var poll = Provider.of<IUnifediApiPoll>(context);

    return Text(
      '(${poll.votesCount.toString()})',
      style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
    );
  }
}

class PollOptionVotesPercentWidget extends StatelessWidget {
  static final NumberFormat _format = NumberFormat('#%');

  const PollOptionVotesPercentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var poll = Provider.of<IUnifediApiPoll>(context);
    var pollOption = Provider.of<IUnifediApiPollOption>(context);

    var isOwnVote = poll.isOwnVote(pollOption);

    var votesPercent = poll.votesPercent(pollOption);

    return SizedBox(
      // todo: refactor
      // ignore: no-magic-number
      width: 60,
      child: Center(
        child: Text(
          _format.format(votesPercent),
          style: isOwnVote
              ? IFediUiTextTheme.of(context).bigTallPrimaryDark
              : IFediUiTextTheme.of(context).bigTallGrey,
        ),
      ),
    );
  }
}

class PollOptionTitleWidget extends StatelessWidget {
  const PollOptionTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var poll = Provider.of<IUnifediApiPoll>(context);
    var pollOption = Provider.of<IUnifediApiPollOption>(context);

    var isOwnVote = poll.isOwnVote(pollOption);

    var votesPercent = poll.votesPercent(pollOption);

    return Text(
      pollOption.title,
      style: poll.isPossibleToVote
          ? IFediUiTextTheme.of(context).bigTallPrimaryDark
          : isOwnVote && votesPercent > 0
              ? IFediUiTextTheme.of(context).bigTallWhite
              : IFediUiTextTheme.of(context).bigTallGrey,
      overflow: TextOverflow.ellipsis,
    );
  }
}
