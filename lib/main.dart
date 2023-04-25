import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BMIcalculator()));
}

class BMIcalculator extends StatefulWidget {
  const BMIcalculator({Key? key}) : super(key: key);

  @override
  State<BMIcalculator> createState() => _BMIcalculatorState();
}

class _BMIcalculatorState extends State<BMIcalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const NavigationDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 0, 20),
            child: TextButton(onPressed: () =>{}, style: TextButton.styleFrom
              (backgroundColor: Colors.purple , primary: Colors.white , fixedSize: Size(200, 50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Men"),
                  Icon(Icons.man)
                ],
              ) ,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100.0,20,0,20),
            child: TextButton(onPressed: () =>{}, style: TextButton.styleFrom
              (backgroundColor: Colors.purple , primary: Colors.white , fixedSize: Size(200, 50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Women"),
                  Icon(Icons.woman)
                ],
              ) ,
            ),
          ),
        ],
      )
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildList(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  Widget buildList(BuildContext context) => Column(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.man),
            title: Text("Men"),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.girl),
            title: Text("Women"),
            onTap: () => {},
          ),
        ],
      );
}
