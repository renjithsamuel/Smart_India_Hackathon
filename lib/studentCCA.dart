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
        child: Container(
          width: 700,
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

                    Container(
                      width: 600,
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Activity ID:  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              // a
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SizedBox(
                                  child: TextFormField(
                                    controller: activitynameController,
                                    decoration: const InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(7),
                                        border: UnderlineInputBorder(),
                                        hintText: 'Enter Activity ID',
                                        hintStyle: TextStyle(fontSize: 15)),
                                  ),
                                ),
                              ),
                              Text('')
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    // activity type

                    Container(
                      width: 600,
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Activity Type:  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: DropdownButton<String>(
                                  value: dropdownValue2,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: TextStyle(color: Colors.black54),
                                  isExpanded: true,
                                  dropdownColor: Colors.purple[50],
                                  underline: Container(
                                    height: 0.8,
                                    color: Colors.black54,
                                  ),
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
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(fontSize: 15),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Text('')
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // status
                    Container(
                      width: 600,
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status :  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: DropdownButton<String>(
                                  value: dropdownValue3,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: TextStyle(color: Colors.black54),
                                  isExpanded: true,
                                  dropdownColor: Colors.purple[50],
                                  underline: Container(
                                    height: 0.8,
                                    color: Colors.black54,
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
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(fontSize: 15),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Text('')
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // startdate
                    Container(
                      width: 600,
                      height: 110,
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start Date:  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  controller: date_inputaController,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8),
                                      hintText: 'Start Date',
                                      hintStyle: TextStyle(fontSize: 15)),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1500),
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(pickedDate);
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(formattedDate);

                                      setState(() {
                                        date_inputaController.text =
                                            formattedDate;
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                              ),
                              Container()
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    // END DATE

                    Container(
                      width: 600,
                      height: 110,
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End Date:  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  controller: date_inputbController,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8),
                                      hintText: 'End Date',
                                      hintStyle: TextStyle(fontSize: 15)),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1500),
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(pickedDate);
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(formattedDate);

                                      setState(() {
                                        date_inputbController.text =
                                            formattedDate;
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                              ),
                              Container()
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // VERIFICATION
                    Container(
                      width: 600,
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Verification :  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: DropdownButton<String>(
                                  value: dropdownValue4,
                                  icon: Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black54),
                                  dropdownColor: Colors.purple[50],
                                  isExpanded: true,
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
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(fontSize: 16),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Text('')
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // Text('Student ID :  '),
                    Container(
                      width: 600,
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Student ID:  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SizedBox(
                                  child: TextFormField(
                                    controller: studentidController,
                                    decoration: const InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(5),
                                        border: UnderlineInputBorder(),
                                        hintText: 'Enter your studentid',
                                        hintStyle: TextStyle(fontSize: 15)),
                                  ),
                                ),
                              ),
                              Text('')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
