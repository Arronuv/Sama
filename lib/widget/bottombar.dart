import 'package:flutter/material.dart';
import 'package:sama/helper.dart';
import 'package:sama/theme.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.appTheme,
    required this.helper,
  }) : super(key: key);

  final AppTheme appTheme;
  final Helper helper;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      //expand: true,
        initialChildSize: 0.25,
        minChildSize: 0.25,
        maxChildSize: 0.25,
        builder:
            (BuildContext context, ScrollController scrollController) {
          return Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30))),
              height: 200.00,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Weather Today',
                      style:
                      appTheme.getBoldTextStyle(23.0, Colors.black),
                    ),
                    const SizedBox(height: 7.0,),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: helper.forecastData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0,
                                left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  'https:${helper.forecastData[index].icon}',
                                  height: 40,),
                                Text(
                                  helper.forecastData[index].time,
                                  style: appTheme.getBoldTextStyle(
                                      15, Colors.grey),
                                ),
                                const SizedBox(height: 10.0,),
                                Text(
                                  '${helper.forecastData[index].temp}°',
                                  style: appTheme.getBoldTextStyle(
                                      20.0, Colors.black),
                                )
                              ],
                            ),
                          );
                        },),
                    ),
                  ],
                ),
              ));
        });
  }
}