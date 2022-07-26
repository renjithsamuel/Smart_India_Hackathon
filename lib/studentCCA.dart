import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final date_inputaController = TextEditingController();
  final date_inputbController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    studentidController.dispose();
    super.dispose();
  }


  // DropdownButton
  // String dropdownValue1 = 'activity_name';
  String dropdownValue2 = 'Activity Type';
  String dropdownValue3 = 'Status';
  String dropdownValue4 = 'Verification';

  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Co-curricular activities'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 1000,
              child: Material(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(15),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // activity name

                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('Activity ID:  ')),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 250,
                                child: TextFormField(
                                  controller: activitynameController,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter Activity ID',
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
                              child: DropdownButtonFormField<String>(
                                value: dropdownValue2,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 10,
                                style:
                                const TextStyle(color: Colors.black54),

                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue2 = newValue!;
                                  });
                                },
                                items: <String>[
                                  "Activity Type",
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
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                style:
                                const TextStyle(color: Colors.black54),
                                underline: Container(
                                  height: 0.51,
                                  color: Colors.black,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue3 = newValue!;
                                  });
                                },
                                items: <String>[
                                  "Status",
                                  "Winner",
                                  "Participated"
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
                              child: Text(''),
                            )
                          ],
                        ),

                        // startdate
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('Start Date:  ')),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: date_inputaController,
                                decoration: InputDecoration(
                                  hintText: 'Start Date',
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context, initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101)
                                  );

                                  if(pickedDate != null ){
                                    print(pickedDate);
                                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                    print(formattedDate);

                                    setState(() {
                                      date_inputaController.text = formattedDate;
                                    });
                                  }else{
                                    print("Date is not selected");
                                  }
                                },
                              ),
                            ),
                            Expanded(flex:10,child: Container())
                          ],
                        ),

                        SizedBox(height: 8),

                        // END DATE

                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('End Date:  ')),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: date_inputbController,
                                decoration: InputDecoration(
                                  hintText: 'End Date',
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context, initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101)
                                  );

                                  if(pickedDate != null ){
                                    print(pickedDate);
                                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                    print(formattedDate);

                                    setState(() {
                                      date_inputbController.text = formattedDate;
                                    });
                                  }else{
                                    print("Date is not selected");
                                  }
                                },
                              ),
                            ),
                            Expanded(flex:10,child: Container())
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
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                style:
                                const TextStyle(color: Colors.black54),
                                underline: Container(
                                  height: 0.51,
                                  color: Colors.black,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue4 = newValue!;
                                  });
                                },
                                items: <String>[
                                  "Verification",
                                  "Accepted",
                                  "Rejected"
                                ].map<DropdownMenuItem<String>>((String value) {
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}