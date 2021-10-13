import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountListAvatarWidget extends StatelessWidget {
  final double baseAvatarSize;

  const AccountListAvatarWidget({
    this.baseAvatarSize = FediSizes.appBarAvatarSize,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: baseAvatarSize,
        // ignore: no-equal-arguments
        height: baseAvatarSize,
        child: _AccountListAvatarBodyWidget(baseAvatarSize: baseAvatarSize),
      );
}

class _AccountListAvatarBodyWidget extends StatelessWidget {
  const _AccountListAvatarBodyWidget({
    Key? key,
    required this.baseAvatarSize,
  }) : super(key: key);

  final double baseAvatarSize;

  @override
  Widget build(BuildContext context) {
    var accounts = Provider.of<List<IAccount>>(context);
    if (accounts.isEmpty) {
      return const SizedBox.shrink();
    }

    if (accounts.length == 1) {
      var account = accounts.first;

      return Provider<IAccount>.value(
        value: account,
        child: _AccountListAvatarSingleAccountWidget(
          baseAvatarSize: baseAvatarSize,
        ),
      );
    } else {
      return _AccountListAvatarMultiAccountWidget(
        baseAvatarSize: baseAvatarSize,
      );
    }
  }
}

class _AccountListAvatarSingleAccountWidget extends StatelessWidget {
  const _AccountListAvatarSingleAccountWidget({
    Key? key,
    required this.baseAvatarSize,
  }) : super(key: key);

  final double baseAvatarSize;

  @override
  Widget build(BuildContext context) => ClipRRect(
        // ignore: no-magic-number
        borderRadius: BorderRadius.circular(baseAvatarSize / 2),
        child: ProxyProvider<IAccount, String?>(
          update: (context, account, _) => account.avatar,
          child: AccountAvatarUrlWidget(
            // ignore: no-magic-number
            progressSize: baseAvatarSize / 2,
            imageSize: baseAvatarSize,
          ),
        ),
      );
}

class _AccountListAvatarMultiAccountWidget extends StatelessWidget {
  const _AccountListAvatarMultiAccountWidget({
    Key? key,
    required this.baseAvatarSize,
  }) : super(key: key);

  final double baseAvatarSize;

  @override
  Widget build(BuildContext context) {
    var accounts = Provider.of<List<IAccount>>(context);
    switch (accounts.length) {
      // ignore: no-magic-number
      case 2:
        return _AccountListAvatarMultiAccountTwoWidget(
          baseAvatarSize: baseAvatarSize,
        );
      // ignore: no-magic-number
      case 3:
        return _AccountListAvatarMultiAccountThreeWidget(
          baseAvatarSize: baseAvatarSize,
        );
      // ignore: no-magic-number
      case 4:
        return _AccountListAvatarMultiAccountFourWidget(
          baseAvatarSize: baseAvatarSize,
        );
      default:
        return _AccountListAvatarMultiAccountFiveAndMoreWidget(
          baseAvatarSize: baseAvatarSize,
        );
    }
  }
}

class _AccountListAvatarMultiAccountTwoWidget extends StatelessWidget {
  const _AccountListAvatarMultiAccountTwoWidget({
    Key? key,
    required this.baseAvatarSize,
  }) : super(key: key);

  final double baseAvatarSize;

  @override
  Widget build(BuildContext context) {
    const sizeMultiplier = 0.7;
    var accounts = Provider.of<List<IAccount>>(context);

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Provider<IAccount>.value(
            value: accounts[0],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Provider<IAccount>.value(
            value: accounts[1],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
      ],
    );
  }
}

class _AccountListAvatarMultiAccountThreeWidget extends StatelessWidget {
  const _AccountListAvatarMultiAccountThreeWidget({
    Key? key,
    required this.baseAvatarSize,
  }) : super(key: key);

  final double baseAvatarSize;

  @override
  Widget build(BuildContext context) {
    const sizeMultiplier = 0.65;
    var accounts = Provider.of<List<IAccount>>(context);

    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Provider<IAccount>.value(
            value: accounts[0],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Provider<IAccount>.value(
            value: accounts[1],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Provider<IAccount>.value(
            // ignore: no-magic-number
            value: accounts[2],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
      ],
    );
  }
}

class _AccountListAvatarMultiAccountFourWidget extends StatelessWidget {
  const _AccountListAvatarMultiAccountFourWidget({
    Key? key,
    required this.baseAvatarSize,
  }) : super(key: key);

  final double baseAvatarSize;

  @override
  Widget build(BuildContext context) {
    const sizeMultiplier = 0.6;
    var accounts = Provider.of<List<IAccount>>(context);

    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Provider<IAccount>.value(
            value: accounts[0],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Provider<IAccount>.value(
            value: accounts[1],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Provider<IAccount>.value(
            // ignore: no-magic-number
            value: accounts[2],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Provider<IAccount>.value(
            // ignore: no-magic-number
            value: accounts[3],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
      ],
    );
  }
}

class _AccountListAvatarMultiAccountFiveAndMoreWidget extends StatelessWidget {
  const _AccountListAvatarMultiAccountFiveAndMoreWidget({
    Key? key,
    required this.baseAvatarSize,
  }) : super(key: key);

  final double baseAvatarSize;

  @override
  Widget build(BuildContext context) {
    const sizeMultiplier = 0.55;
    var accounts = Provider.of<List<IAccount>>(context);

    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Provider<IAccount>.value(
            value: accounts[0],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Provider<IAccount>.value(
            value: accounts[1],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Provider<IAccount>.value(
            // ignore: no-magic-number
            value: accounts[2],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Provider<IAccount>.value(
            // ignore: no-magic-number
            value: accounts[3],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Provider<IAccount>.value(
            // ignore: no-magic-number
            value: accounts[4],
            child: _AccountListAvatarMultiAccountImageWidget(
              sizeMultiplier: sizeMultiplier,
              baseAvatarSize: baseAvatarSize,
            ),
          ),
        ),
      ],
    );
  }
}

class _AccountListAvatarMultiAccountImageWidget extends StatelessWidget {
  const _AccountListAvatarMultiAccountImageWidget({
    Key? key,
    required this.baseAvatarSize,
    required this.sizeMultiplier,
  }) : super(key: key);

  final double baseAvatarSize;
  final double sizeMultiplier;

  @override
  Widget build(BuildContext context) => Container(
        width: baseAvatarSize * sizeMultiplier,
        // ignore: no-equal-arguments
        height: baseAvatarSize * sizeMultiplier,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            // todo: refactor
            // ignore: no-magic-number
            Radius.circular(baseAvatarSize * sizeMultiplier / 2),
          ),
          border: Border.all(
            // ignore: no-magic-number
            color: IFediUiColorTheme.of(context).white.withOpacity(0.5),
            // ignore: no-magic-number
            width: 2.0,
          ),
        ),
        child: ClipRRect(
          borderRadius:
              // ignore: no-magic-number
              BorderRadius.circular(baseAvatarSize / 2 * sizeMultiplier),
          child: ProxyProvider<IAccount, String?>(
            update: (context, account, _) => account.avatar,
            child: AccountAvatarUrlWidget(
              // ignore: no-magic-number
              progressSize: baseAvatarSize / 2 * sizeMultiplier,
              imageSize: baseAvatarSize * sizeMultiplier,
            ),
          ),
        ),
      );
}
