import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:easy_localization/easy_localization.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingBouncingGrid.square(
            borderColor: Theme.of(context).disabledColor,
            backgroundColor: Theme.of(context).primaryColor,
            borderSize: 3.0,
            size: 30.0,
          ),
          Text('Loading').tr(),
        ],
      ),
    );
  }
}
