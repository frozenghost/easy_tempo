import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationCard extends StatelessWidget {
  const NavigationCard(
      {Key key, this.title, this.description, this.issueKey, this.secondsSpend})
      : super(key: key);

  final String title;
  final String description;
  final String issueKey;
  final int secondsSpend;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 140.0,
        child: Card(
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Expanded(
                  child: Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.openSans(
                        color: Theme.of(context).primaryColor, fontSize: 15.0),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      color: Colors.green.shade400,
                      child: Icon(
                        FontAwesomeIcons.check,
                        color: Colors.white,
                        size: 10.0,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      issueKey,
                      style: GoogleFonts.openSans(
                          color: Theme.of(context).disabledColor),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      displayTimeSpent(),
                      style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }

  String displayTimeSpent() {
    double result = secondsSpend / 60 / 60;
    if (result < 1) {
      return '${(result * 60).toStringAsFixed(0)}m';
    } else {
      double truncate = result.truncateToDouble();
      double digitals = result - truncate;

      return '${result.truncate()}h ' +
          (digitals > 0 ? '${(digitals * 60).toStringAsFixed(0)}m' : '');
    }
  }
}
