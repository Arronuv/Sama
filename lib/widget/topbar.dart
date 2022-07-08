import 'package:flutter/material.dart';
import 'package:sama/helper.dart';
import 'package:sama/theme.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.helper,
    required this.appTheme,
  }) : super(key: key);

  final Helper helper;
  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 7.0, 0.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_pin,
                size: 20.0,
                color: Colors.white,
              )),
          Text(
            helper.currentWeather.city,
            style: appTheme.getRegularTextStyle(20.0, Colors.white),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                size: 30.0,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}