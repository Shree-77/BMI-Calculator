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

  var Valuechoose;
  List listitem = [
    "Male" , "Female"
  ];
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: " Enter your Height in meters "),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: " Enter your weight in KG "),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton(
              hint: Text("Select Gender"),
              value: Valuechoose,
              onChanged: (newValue){
                setState(() {
                  Valuechoose=newValue;
                });
                },
              items: listitem.map((valueItem){
                return DropdownMenuItem(
                  value: valueItem,
                  child:Text(valueItem),
                );
              }).toList(),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.purple,
                    primary: Colors.white,
                    fixedSize: Size(200, 50)),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Calculate"), Icon(Icons.calculate)],
                ),
              ),
            ),
          ],
        ));
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
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BMIcalculator()))
            },
          ),
          ListTile(
            leading: Icon(Icons.man),
            title: Text("Men"),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MenBMI()))
            },
          ),
          ListTile(
            leading: Icon(Icons.girl),
            title: Text("Women"),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WomenBMI()))
            },
          ),
        ],
      );
}

class MenBMI extends StatelessWidget {
  const MenBMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Weight Status Chart - Men '),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(),
          children: const [
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text(
                      'BMI',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text(
                      'Weight Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text('18.5 - 24.9'),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text('Healthy Weight'),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text('25.0 - 29.9'),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text('Overweight'),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text('30.0 and Above'),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text('Obesity'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WomenBMI extends StatelessWidget {
  const WomenBMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Weight Status Chart - Men '),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(),
          children: const [
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text(
                      'BMI',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text(
                      'Weight Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text('Below 18.5'),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text('Under Weight'),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text('18.5—24.9'),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text('Healthy weight'),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text('25.0—29.9'),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text('Over weight'),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text('30.0 and Above'),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text('Obesity'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

