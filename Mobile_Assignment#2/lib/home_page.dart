import 'package:flutter/material.dart';

enum SingingCharacter { Male, Female }

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

 var height = 0, age = 0;
 double sum = 0;
class HomePageState extends State<HomePage> {
  

  SingingCharacter? _character = SingingCharacter.Male;
  final TextEditingController t1 = new TextEditingController(text: "");
  final TextEditingController t2 = new TextEditingController(text: "");

  

  void doSubmit() {
    setState(() {

      height = int.parse(t1.text);
      age = int.parse(t2.text);
      
      
      if(_character == SingingCharacter.Male ){
        sum = (height - 100)-((height-150)/4);
    }
      else if(_character == SingingCharacter.Female ){
        sum = (height - 100)-((height-150)/2);
      }
      
    });
    showAlertDialog(context);
  }

  void doClear() {
    setState(() {
      t1.text = "";
      t2.text = "";
      sum=0;
    });
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: new Text("Ideal body weight (IBW) calculator"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Enter Your Information ",
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
           
  






 
    new Column(
      children: <Widget>[
        ListTile(
          title: const Text('Male'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Male,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Female'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Female,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    ),
  





           
            new TextField(

 keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter your Height in (cm)  "),
              controller: t1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter your age"),
              controller: t2,
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Submit"),
                  minWidth: 230.0,
                  color: Colors.blue,
                  onPressed: doSubmit,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () { Navigator.of(context).pop(); },
  );

  Widget RestartButton = TextButton(
    child: Text("RE-CALCULATE"),
    onPressed: () { Navigator.of(context).pop(); },
  );


  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Your Results"),
    content: Text(" Results = $sum KG"),
  actions: [
      okButton,
      //RestartButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
