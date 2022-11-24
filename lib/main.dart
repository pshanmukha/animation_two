import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isFirstImage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(176, 243, 241, 1),
              Color.fromRGBO(255, 207, 223, 1),
            ]
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCrossFade(
                firstChild: Image.network('https://picsum.photos/200'),
                secondChild: Image.network('https://picsum.photos/200/300'),
                crossFadeState: _isFirstImage ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration:const Duration(seconds: 1),
              ),
              const SizedBox(height: 4,),
              TextButton(onPressed: (){
                setState(() {
                  _isFirstImage = !_isFirstImage;
                });
              }, child:const Text('AnimatedCrossFade',style: TextStyle(fontSize: 20),))
            ],
          ),
        ),
      ),
    );
  }
}

