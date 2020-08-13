import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  void _savePassword(){
    print("Password saved");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"), centerTitle: true,),
        body: SingleChildScrollView(
        child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                DropDownField(
                  controller: countrySelected,
                  hintText: "Select a country",
                  enabled: true,
                  items: countries,
                  onValueChanged: (value)
                  {
                    setState(() {
                      selectCountry = value;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle, color: Colors.green[500]),
                    SizedBox(width: 5),
                    Text('First Name:', style: new TextStyle(color: Color(0xFF2E3233)),),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Your First Name',
                        ),
                        cursorWidth: 2,
                      ),),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.security, color: Colors.green[500]),
                    SizedBox(width: 5),
                    Text('Password:', style: new TextStyle(color: Color(0xFF2E3233)),),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Your Password',
                        ),
                        cursorWidth: 2,
                      ),),
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  RaisedButton (
                    color: Colors.blue,
                    child: Text('Change Password?'),
                      onPressed: selectCountry=="CANADA"? _savePassword:null,
                    ),
                  ],
                )
              ],
            ),
          ),
    )
        )
    );
  }
}

String selectCountry="";
final countrySelected = TextEditingController();

// List of countries
List<String> countries = [
  "CANADA",
  "USA",
  "INDIA",
  "RUSSIA"
];