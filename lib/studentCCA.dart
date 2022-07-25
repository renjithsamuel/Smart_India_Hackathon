import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  final studentidController = TextEditingController();
    final activitynameController = TextEditingController();
 

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    studentidController.dispose();
    super.dispose();
  }

  // date picker init
  DateTime _date = DateTime(2020, 11, 17);

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1930, 1),
      lastDate: DateTime(2030, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  // DropdownButton
  // String dropdownValue1 = 'activity_name';
  String dropdownValue2 = 'Choose';
  String dropdownValue3 = 'Choose';
  String dropdownValue4 = 'Choose';

  // List of items in our dropdown menu


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // activity name 
                Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: activitynameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter Activity name',
                  ),
                ),
              ),

              
              // activity type

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Activity Type:  ')),
                  Expanded(
                    flex: 2,
                    child: DropdownButton<String>(
                      value: dropdownValue2,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue2 = newValue!;
                          
                        });
                      },
                      items: <String>[
                        "Choose",
                        "Technical",
                        "Non-Technical",
                        "Sports"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(""))
                ],
              ),


                // status 
              Row(
                children: [Text('Status :  '),
                  DropdownButton<String>(
                    value: dropdownValue3,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue3 = newValue!;
                      });
                    },
                    items: <String>["Choose", "Winner", "Participated"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),

              // startdate
              Row(
                children: [
                  Text('Start Date:  '),
                  ElevatedButton(
                    onPressed: _selectDate,
                    child: Text('SELECT DATE OF START DATE'),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Selected DOB: $_date',
              ),

              

              // END DATE
              Row(
                children: [Text('End Date:  '),
                  ElevatedButton(
                    onPressed: _selectDate,
                    child: Text('SELECT DATE OF END DATE'),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Selected DOB: $_date',
              ),

              

              // VERIFICATION
              Row(
                children: [
                  Text('Verification :  '),

                  DropdownButton<String>(
                    value: dropdownValue4,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue4 = newValue!;
                      });
                    },
                    items: <String>["Choose", "Accepted","Rejected"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),

              // Text('Student ID :  '),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: studentidController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your studentid',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
