import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo By Joseph',
      theme: ThemeData(
        backgroundColor: Colors.pink,
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: const Appext(tittle: 'Flutter Demo By Joseph'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Appext(
      tittle: "Our Next page",
    );
  }
}

class Appext extends StatefulWidget {
  const Appext({super.key, required this.tittle});

  final String tittle;

  @override
  State<Appext> createState() => _AppextState();
}

class _AppextState extends State<Appext> {
  int _counter = 0, currentindex = 0;
  var intVa = 1, intVar = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 2;
    });
  }

  void generate() {
    setState(() {
      intVa = Random().nextInt(1999);
      intVar += intVa;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tittle),
      ),
      body: Center(
        child: currentindex == 0
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'You\'ve pressed the increase button \u{1F493} this many times:',
                    ),
                    Text(
                      '$_counter \u{1F496} \u{1F970}',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const Text(
                      "For the fisrt created an App that ran succesfully",
                    ),
                    Text(
                      "The random numbers generated is $intVa",
                    ),
                    Text(
                      "The Sum of the random numbers generated  is $intVar",
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.blue,
                          primary: Colors.black87,
                          shadowColor: Colors.deepOrange),
                      onPressed: _incrementCounter,
                      child: const Text("Increase"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SecondPage(),
                          ),
                        );
                      },
                      child: const Text("Next Page"),
                    ),
                  ],
                ),
              )
            : Image.asset('images/used.jpg'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: generate,
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_alert),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      // bottomNavigationBar: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   hoverColor: Colors.black38,
      //   //tooltip: 'Increment',
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            backgroundColor: Colors.black26,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.policy),
            label: "Terms & Condition",
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: currentindex,
        onTap: (int index) {
          setState(() {
            currentindex = index;
          });
        },
        iconSize: 35,
        fixedColor: Colors.red,
        backgroundColor: Colors.white24,
        unselectedItemColor: Colors.deepPurple,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text(widget.title),
          ),
    );
  }
}
