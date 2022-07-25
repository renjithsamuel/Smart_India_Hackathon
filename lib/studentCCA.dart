import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Co-curricular activities',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
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
  DateTime _sdate = DateTime(2020, 11, 17);

  void _selectstartDate() async {
    final DateTime? newsDate = await showDatePicker(
      context: context,
      initialDate: _sdate,
      firstDate: DateTime(1930, 1),
      lastDate: DateTime(2030, 7),
      helpText: 'Select a date',
    );
    if (newsDate != null) {
      setState(() {
        _sdate = newsDate;
      });
    }
  }


    DateTime _edate = DateTime(2020, 11, 17);
    void _selectendDate() async {
    final DateTime? neweDate = await showDatePicker(
      context: context,
      initialDate: _edate,
      firstDate: DateTime(1930, 1),
      lastDate: DateTime(2030, 7),
      helpText: 'Select a date',
    );
    if (neweDate != null) {
      setState(() {
        _edate = neweDate;
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
        title: const Text('Student Co-curricular activities'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // activity name

              Row(
                children: [
                  Expanded(flex: 2, child: Text('Activity id:  ')),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: activitynameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter Activity name',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(''),
                  )
                ],
              ),

              // activity type

              Row(
                children: [
                  Expanded(flex: 2, child: Text('Activity Type:  ')),
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
                  Expanded(flex: 10, child: Text(""))
                ],
              ),

              // status
              Row(
                children: [
                  Expanded(flex: 2, child: Text('Status :  ')),
                  Expanded(
                    flex: 2,
                    child: DropdownButton<String>(
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
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(''),
                  )
                ],
              ),

              // startdate
              Row(
                children: [
                  Expanded(flex: 2 ,child: Text('Start Date:  ')),
                  Expanded(flex: 5,
                    child: ElevatedButton(
                      onPressed: _selectstartDate,
                      child: Text('SELECT DATE OF START DATE'),
                    ),
                  ),
                  Expanded(flex:5,child: Text('')),
              SizedBox(height: 8),
              Text(
                'Selected Start date: $_sdate',
              ),
                ],
              ),

              SizedBox(height: 8),
              // END DATE
              Row(
                children: [
                  Expanded(flex:2,child: Text('End Date:  ')),
                  Expanded(flex:5,
                    child: ElevatedButton(
                      onPressed: _selectendDate,
                      child: Text('SELECT DATE OF END DATE'),
                    ),
                  ),
                  Expanded(flex:5,child: Text('')),
                   SizedBox(height: 8),
              Text(
                'Selected End date: $_edate',
              ),
                ],
              ),

             

              // VERIFICATION
              Row(
                children: [
                  Expanded(flex: 2, child: Text('Verification :  ')),
                  Expanded(
                    flex: 2,
                    child: DropdownButton<String>(
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
                      items: <String>["Choose", "Accepted", "Rejected"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(flex: 10, child: Text(''))
                ],
              ),

              // Text('Student ID :  '),
              Row(
                children: [
                  Expanded(flex: 2, child: Text('Student ID:  ')),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: studentidController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your studentid',
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 10, child: Text(''))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
