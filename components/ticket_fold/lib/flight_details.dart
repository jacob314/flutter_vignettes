import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;

import 'demo_data.dart';
import 'main.dart';

const textPadding = 16.0;
const marginBetweenRows = 8.0;

class FlightDetails extends StatelessWidget {
  final BoardingPassData boardingPass;
  final TextStyle titleTextStyle = TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 11,
      height: 1,
      letterSpacing: .2,
      fontWeight: FontWeight.w600,
      color: Color(0xffafafaf),
      package: App.pkg);
  final TextStyle contentTextStyle = TextStyle(
      fontFamily: 'Oswald',
      fontSize: 16,
      height: 1.8,
      letterSpacing: .3,
      color: Color(0xff083e64),
      package: App.pkg);
  final TextStyle paragraphTextStyle = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 12,
    height: 1.5,
    letterSpacing: .3,
    color: Color(0xff083e64),
    package: App.pkg,
  );

  FlightDetails(this.boardingPass);

  Widget row({@required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: marginBetweenRows,
        left: textPadding,
        right: textPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: const EdgeInsets.only(top: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gate'.toUpperCase(), style: titleTextStyle),
                      Text(boardingPass.gate, style: contentTextStyle),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Zone'.toUpperCase(), style: titleTextStyle),
                      Text(boardingPass.zone.toString(), style: contentTextStyle),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Seat'.toUpperCase(), style: titleTextStyle),
                      Text(boardingPass.seat, style: contentTextStyle),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Class'.toUpperCase(), style: titleTextStyle),
                      Text(boardingPass.flightClass, style: contentTextStyle),
                    ],
                  ),
                ],
              ),
              row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Flight'.toUpperCase(), style: titleTextStyle),
                      Text(boardingPass.flightNumber, style: contentTextStyle),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Departs'.toUpperCase(), style: titleTextStyle),
                      Text(
                          DateFormat('MMM d, H:mm')
                              .format(boardingPass.departs)
                              .toUpperCase(),
                          style: contentTextStyle),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Arrives'.toUpperCase(), style: titleTextStyle),
                      Text(
                          DateFormat('MMM d, H:mm')
                              .format(boardingPass.arrives)
                              .toUpperCase(),
                          style: contentTextStyle)
                    ],
                  ),
                ],
              ),
              Expanded(
                child: row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('MEALS', style: titleTextStyle),
                          Flexible(
                            child: Text(
                                '• Complimentary Drinks\n'
                                '• Optional Dishes:\n'
                                '    • Chicken\n'
                                '    • Beef\n'
                                '    • Pork\n',
                                style: paragraphTextStyle),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('CHECK-IN POLICY', style: titleTextStyle),
                        Flexible(
                          child: Text(
                              '• Online check-in available.\n'
                              '• Check-in at least 90 minutes before departure time.\n'
                              '• Remember to bring your itinerary and government-issued photo ID'
                              ' for airport check-in and security.\n',
                              style: paragraphTextStyle),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
