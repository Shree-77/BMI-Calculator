import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BMIcalculator(), debugShowCheckedModeBanner: false));
}

class BMIcalculator extends StatefulWidget {
  const BMIcalculator({Key? key}) : super(key: key);

  @override
  State<BMIcalculator> createState() => _BMIcalculatorState();
}

class _BMIcalculatorState extends State<BMIcalculator> {
  var Valuechoose;
  dynamic gender;

  List listitem = ["female", "male"];

  final mycontroller = TextEditingController();
  final mycontroller1 = TextEditingController();

  double weight = 0;
  double height = 0;

  double answer = 0;
  String result = '';

  void BMI() {
    answer = weight / pow(height, 2);
    Calculate(answer);
  }

  void Calculate(double value) {
    String lowercaseGender = gender.toString().toLowerCase();

    if (lowercaseGender != "male" || lowercaseGender != "female") {
      setState(() {
        result='Please Select Gender';
      });
    }


    if (value >= 18.5 && value <= 24.9 && lowercaseGender == "male") {
      setState(() {
        result = 'Healthy weight';
      });
    }else if (value < 18.5 && lowercaseGender == "male" ) {
      setState(() {
        result = 'Underweight';
      });
    } else if (value >= 25.0 && value <= 29.9 && lowercaseGender == "male") {
      setState(() {
        result = 'Overweight';
      });
    } else if (value > 30.0 && lowercaseGender == "male") {
      setState(() {
        result = 'Obese';
      });
    } else if (value < 18.5 && lowercaseGender == "female" ) {
      setState(() {
        result = 'Underweight';
      });
    } else if (value > 18.5 && value <= 24.9 && lowercaseGender == "female") {
      setState(() {
        result = 'Healthy weight';
      });
    } else if (value > 25.0 && value <= 29.9 && lowercaseGender == "female") {
      setState(() {
        result = 'Overweight';
      });
    } else if (value > 30.0 && lowercaseGender == "female") {
      setState(() {
        result = 'Obese';
      });
    }else {
      setState(() {
        result='Invalid Input';
      });
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('BMI Result'),
        content: Text('Your BMI is $value, which means you are $result'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );

  }

  void dispose() {
    mycontroller.dispose();
    mycontroller1.dispose();
    super.dispose();
  }

  void reuse(){
    mycontroller.clear();
    mycontroller1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text(
            "BMI Calculator ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: const NavigationDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: mycontroller1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter your Height in meters",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: mycontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter your weight in KG",
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton(
              hint: Text("Select Gender"),
              value: Valuechoose,
              onChanged: (newValue) {
                setState(() {
                  Valuechoose = newValue;
                  gender = newValue;
                });
              },
              items: listitem.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,


                  child:Text(valueItem),
                );
              }).toList(),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                onPressed: () => {
                  setState((){
                    weight= double.parse(mycontroller.text) ;
                    height= double.parse(mycontroller1.text);
                    BMI();
                    Calculate(answer);
                    reuse();
                  })
                  },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.purple,
                    primary: Colors.white,
                    fixedSize: Size(200, 50)),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("Calculate"), Icon(Icons.calculate)],
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
            leading: const Icon(Icons.man),
            title: const Text("Men"),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const MenBMI()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.girl),
            title: const Text("Female"),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const WomenBMI()))
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
      body: Center(
        child: Padding(
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
      body: Center(
        child: Padding(
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
      ),
    );
  }
}

