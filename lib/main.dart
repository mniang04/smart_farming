/* import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: new ThemeData(
        
        primarySwatch: Colors.yellow,
      ), 
  home: 
      Scaffold(
        appBar: AppBar(title: Text('Myself')), 
        body: Text('Hello word, it\'my first test')),
        debugShowCheckedModeBanner: false,);
  }
}
 */



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hnapp/screens/iotscreen.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String,WidgetBuilder> {
        '/iotscreen' : (BuildContext context) => IotScreen()
      },
      debugShowCheckedModeBanner: false,
      //theme app
      theme: ThemeData(brightness: Brightness.dark
      ),
      home: IotScreen(),
    );
  }
}