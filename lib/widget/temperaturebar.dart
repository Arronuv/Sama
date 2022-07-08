import 'package:flutter/material.dart';
import 'package:sama/helper.dart';
import 'package:sama/theme.dart';

class TemperatureBar extends StatelessWidget {
  const TemperatureBar({
    Key? key,
    required this.helper,
    required this.appTheme,
  }) : super(key: key);

  final Helper helper;
  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 5.0, 15.0, 10.0),
      child: Row(
        children: [
          Text(
            '${helper.currentWeather.temperature}°',
            style: appTheme.getMediumTextStyle(90.0, Colors.white60),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 30.0),
            child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  helper.currentWeather.condition,
                  style: appTheme.getLightTextStyle(17.0, Colors.white),
                )),
          )
        ],
      ),
    );
  }
}