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
  final roll_noController = TextEditingController();
  final parent1nameController = TextEditingController();
  final parent2nameController = TextEditingController();
  final incomeController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final currentAddressController = TextEditingController();
  final permanentAddressController = TextEditingController();

  
  
  
  String? gender;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    roll_noController.dispose();
    parent1nameController.dispose();
    parent2nameController.dispose();
    incomeController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    currentAddressController.dispose();
    permanentAddressController.dispose();
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
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: roll_noController,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your roll_no',
                ),),
              ),
      
      
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: parent1nameController,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your parent1name',
                ),),
              ),
      
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: parent2nameController,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your parent2name',
                ),),
              ),
      
          
      
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: incomeController,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your income',
                ),),
              ),
      
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your email',
                ),),
              ),
      
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: phoneNoController,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your phoneNo',
                ),),
              ),
      
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: currentAddressController,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your currentAddress',
                ),),
              ),
      
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: permanentAddressController,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your permanentAddress',
                ),),
              ),
      
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: null,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your motherTongue',
                ),),
              ),
      
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: null,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your bloodGroup',
                ),),
              ),

              
      
            const Text("What is your gender?", style: TextStyle( 
                     fontSize: 18
                  ),),

                  Divider(),

                  Row(
                    
                    children: [
                      Expanded(
                        child: ListTile(
                          
                           title: Text("Male"),
                           leading: Radio(
                             value: "male", 
                             groupValue: gender, 
                             onChanged: (value){
                                setState(() {
                                   gender = value.toString();
                                });
                             }),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: ListTile(
                       title: Text("Female"),
                       leading: Radio(
                         value: "female", 
                         groupValue: gender, 
                         onChanged: (value){
                            setState(() {
                               gender = value.toString();
                            });
                         }),
                    ),
                  ),

                  Expanded(
                    child: ListTile(
                       title: Text("Other"),
                       leading: Radio(
                         value: "other", 
                         groupValue: gender, 
                         onChanged: (value){
                            setState(() {
                               gender = value.toString();
                            });
                         }),
                    ),
                  ),

      


               ElevatedButton(
              onPressed: _selectDate,
              child: Text('SELECT DATE OF BIRTH'),
              
            ),
            SizedBox(height: 8),
            Text(
              'Selected DOB: $_date',
            ),
      
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text('myController.text'),
                      );
                    },
                  );
                },
                child: const Icon(Icons.play_arrow_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
