import 'package:flutter/material.dart';

class WidgetLifeDemo extends StatelessWidget with WidgetsBindingObserver{

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print('...........$state');
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(this);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: Center(
        child: Text('我是WidgetLifeDemo。。。。。。'),
      ),
    );
  }
}

class WidgetLifeDemo1 extends StatefulWidget {
  WidgetLifeDemo1({ Key key }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _WidgetLifeDemo1State();
}
class _WidgetLifeDemo1State extends State<WidgetLifeDemo1>  with WidgetsBindingObserver{
  int _cnt = 0;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print('lift：$state');
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this); //添加观察者
    // TODO: implement initState
    super.initState();
//    print('。。。。。。initState');
  }
  @override
  void didUpdateWidget(WidgetLifeDemo1 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
//    print('。。。。。。didUpdateWidget');
  }
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
//    print('。。。。。。reassemble');
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
//    print('。。。。。。deactivate');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
//    print('。。。。。。dispose');
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
//    print('。。。。。。didChangeDependencies');
  }
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
//    print('。。。。。。build');
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _cnt += 1;
            });
          },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('我是WidgetLifeDemo1。。。。。。'),
            Text('我是WidgetLifeDemo1。。。。。。'),
            Text('我是WidgetLifeDemo$_cnt。。。。。。'),
            CustomerText(current_string: _cnt.toString(),)
          ],
        ),
      ),
    );
  }
}

class CustomerText extends StatefulWidget {
  final String current_string;
  CustomerText({Key key, this.current_string});
  @override
  State<StatefulWidget> createState() => CustomerTextState();
}
class CustomerTextState extends State<CustomerText> {
  @override
  void didUpdateWidget(CustomerText oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
//    print('CustomerTextState。。。。。。didUpdateWidget');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    print('CustomerTextState。。。。。。initState');
  }
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
//    print('CustomerTextState。。。。。。reassemble');
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
//    print('CustomerTextState。。。。。。deactivate');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
//    print('CustomerTextState。。。。。。dispose');
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
//    print('CustomerTextState。。。。。。didChangeDependencies');
  }
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('我是WidgetLifeDemo${widget.current_string}。。。。。。');
  }
}