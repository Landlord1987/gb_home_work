import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GB_Homework'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<String> list = List.generate(10, (index) => '$index');

  bool _lightIsOn = false;
  bool _isImg1 = false;
  dynamic d = 'http://placekitten.com/g/200/300';
  dynamic c = 'http://placekitten.com/200/300';

  var item = 0;
  final controller = CupertinoTabController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: CupertinoTabScaffold(
          controller: controller,
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return Container(
                  color: Colors.blue,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(45),
                    children: list
                        .map((e) =>
                        Text(e, style: const TextStyle(fontSize: 100)))
                        .toList(),
                  ),
                );
              case 1:
                return Container(
                  color: Colors.green,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(45),
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) => Text(
                          list[index],
                          style: const TextStyle(fontSize: 100))),
                );
              case 2:
                return Container(
                  color: Colors.greenAccent,
                  alignment: FractionalOffset.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.lightbulb_outline,
                          color: _lightIsOn
                              ? Colors.yellow.shade600
                              : Colors.black,
                          size: 200,
                        ),
                      ),
                      GestureDetector(
                        onDoubleTap: () {
                          setState(() {
                            _lightIsOn = !_lightIsOn;
                          });
                        },
                        child: Container(
                          color: Colors.yellow.shade600,
                          padding: const EdgeInsets.all(8),
                          child: Text(
                              style: const TextStyle(fontSize: 48),
                              _lightIsOn ? 'TURN LIGHT OFF' : 'TURN LIGHT ON'),
                        ),
                      ),
                    ],
                  ),
                );
              case 3:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onDoubleTap: () {
                          setState(() {
                            _isImg1 = !_isImg1;
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            _isImg1
                                ? 'http://placekitten.com/g/200/300'
                                : 'http://placekitten.com/200/300',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,

                          ),
                        ),
                      ),
                    ),

                  ],
                );
            }
            return Container();
          },
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.blue,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.remove,
                    color: Colors.white,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_balance,
                    color: Colors.white,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.ad_units,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
