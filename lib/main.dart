import 'package:flutter/material.dart';
import 'package:flutter_application_sdform/sidebarCards.dart';
import 'homeCards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management System',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: studentHome(
        title: 'Student Management',
      ),
    );
  }
}

class studentHome extends StatefulWidget {
  final String title;
  studentHome({Key? key, required this.title}) : super(key: key);

  @override
  State<studentHome> createState() => _studentHomeState();
}

class _studentHomeState extends State<studentHome> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Student Management'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             UserAccountsDrawerHeader(
                  accountEmail: Text('Rsk@gmail.com'),
                  accountName: Text('Rsk'),
                  currentAccountPicture: CircleAvatar(backgroundColor: Colors.amber),

                  decoration: BoxDecoration(color: Colors.purple),
                ),
           
            getsideCards('./lib/assets/icon pack - 1.jpg' , 'item -1', context),
            getsideCards('./lib/assets/icon pack - 2.jpg' , 'item -2', context),
            
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: ListView(
          children: <Widget>[
            getCards('./lib/assets/icon pack - 1.jpg', 'Attendance',
                'Here is a second line'),
            getCards('./lib/assets/icon pack - 2.jpg', 'Profile',
                'Here is a second line'),
            getCards('./lib/assets/icon pack - 3.jpg', 'Exam',
                'Here is a second line'),
            getCards('./lib/assets/icon pack - 4.jpg', 'Time-Table',
                'Here is a second line'),
            getCards('./lib/assets/icon pack - 5.jpg', 'Library',
                'Here is a second line'),
            getCards('./lib/assets/icon pack - 6.jpg', 'Activity',
                'Here is a second line'),
            getCards('./lib/assets/icon pack - 7.jpg', 'Apply leave',
                'Here is a second line'),
            getCards('./lib/assets/icon pack - 8.jpg', 'Track Bus',
                'Here is a second line')
          ],
        ),
      ),
    );
  }
}
