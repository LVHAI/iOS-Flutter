import 'package:flutter/material.dart';

class AppFlutterLife extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppFlutterLifeState();
  }
}

class _AppFlutterLifeState extends State<AppFlutterLife> with WidgetsBindingObserver {

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print('didChangeAppLifecycleState:$state');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('AppFlutterLife'),
    );
  }

}