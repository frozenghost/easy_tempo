import 'package:easy_tempo/widgets/tag_path.dart';
import 'package:flutter/material.dart';

class TagButton extends StatelessWidget {
  const TagButton({
    Key key,
    this.text,
    this.icon,
    this.backgroundColor,
    @required this.onPressed,
  }) : super(key: key);

  final Text text;
  final IconData icon;
  final Color backgroundColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TagPath(),
      child: Stack(children: [
        Container(
          color: backgroundColor,
          width: 100.0,
          alignment: Alignment.topCenter,
          child: Center(
            child: FlatButton(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 17.0,
                  ),
                  Icon(
                    icon,
                    size: 16.0,
                    color: Theme.of(context).backgroundColor,
                  ),
                  text,
                  SizedBox(
                    width: 7.0,
                  ),
                  Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(width: 0, style: BorderStyle.none),
                    ),
                  ),
                ],
              ),
              onPressed: onPressed,
            ),
          ),
        ),
      ]),
    );
  }
}
