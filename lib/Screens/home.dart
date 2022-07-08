import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sama/helper.dart';
import 'package:sama/theme.dart';
import 'package:sama/widget/bottombar.dart';
import 'package:sama/widget/temperaturebar.dart';
import 'package:sama/widget/topbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Helper helper;
  late AppTheme appTheme;
  List<Widget> hourlyWeather = [];

  @override
  initState() {
    helper = Provider.of<Helper>(context, listen: false);
    appTheme = AppTheme();
    super.initState();
    _load();
  }

  void _load() async {
    var res= await helper.getCureentWeather(helper);

    if(res!=null){
      helper.messageShow(context, false, res);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: RefreshIndicator(
        backgroundColor: Colors.transparent,
        onRefresh: () async {
          await helper.getCureentWeather(helper);
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      helper.isDay
                          ? 'assets/images/day.jpg'
                          : 'assets/images/night.png',
                    )),
              ),
            ),
            ListView(
              children: _getBody(),
            ),
            BottomBar(appTheme: appTheme, helper: helper),
          ],
        ),
      ),
    );
  }
  _getBody() {
    List<Widget> ls = [];

    ls.add(TopBar(helper: helper, appTheme: appTheme));

    ls.add(
        TemperatureBar(helper: helper, appTheme: appTheme)); //Temperature Bar

    return ls;
  }
}


