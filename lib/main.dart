import 'package:flutter/material.dart';
//import 'package:flutter/src/material/colors.dart';
import 'dart:math';
import 'dart:core';
import 'second_page.dart';

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
        backgroundColor: const Color.fromARGB(255, 80, 28, 45),
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
  bool _isClicked = false;

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
        backgroundColor: const Color.fromARGB(213, 31, 17, 233),
        shadowColor: const Color.fromARGB(255, 94, 7, 1),
      ),
      body: Center(
        child: currentindex == 0
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color.fromARGB(255, 209, 157, 157),
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
                        onPrimary: const Color.fromARGB(255, 89, 166, 230),
                        primary: const Color.fromARGB(221, 38, 34, 49),
                        shadowColor: const Color.fromARGB(255, 47, 24, 73),
                      ),
                      onPressed: _incrementCounter,
                      child: const Text("Increase"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Color.fromARGB(233, 175, 228, 156),
                      ),
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
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _isClicked = !_isClicked;
                  });
                },
                child: _isClicked
                    ? Image.asset('images/used.jpg')
                    : Image.asset('images/joss.jpg'),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: generate,
        tooltip: 'Increment',
        backgroundColor: const Color.fromARGB(172, 44, 133, 22),
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
            backgroundColor: Color.fromARGB(255, 112, 18, 70),
          ),
        ],
        currentIndex: currentindex,
        onTap: (int index) {
          setState(() {
            currentindex = index;
          });
        },
        iconSize: 35,
        fixedColor: const Color.fromARGB(255, 209, 10, 43),
        backgroundColor: const Color.fromARGB(60, 54, 53, 53),
        unselectedItemColor: const Color.fromARGB(255, 83, 14, 204),
      ),
    );
  }
}
