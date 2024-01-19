import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.username, required this.email});

  final String username;
  final String email;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> group_data = [];
  List<Widget> _options = [];
  int selectedIndex = 0;
  int profilephoto = Random().nextInt(3);
  List<bool> selectedType = <bool>[false, false, false];

  @override
  void initState() {
    super.initState();
    group_data = ['GHC', 'St.Augustine', 'Pensacola', 'Home'];

    _options = [
      Builder(builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Center(
            child: Column(
              children: [
                Column(
                  children:
                      group_data.map((data) => groupDisplay(data)).toList(),
                ),
                SizedBox(height: 25.0),
                ElevatedButton.icon(
                  onPressed: () {
                    AddGroupModal(context);
                  },
                  icon: Icon(
                    Icons.group_add_outlined,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  label: Text(
                    'Start a new group',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
                SizedBox(height: 25.0),
              ],
            ),
          );
        });
      }),
      Center(),
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/profilephoto' + profilephoto.toString() + '.jpg'),
                  radius: 60.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.username,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Text(widget.email,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400))
                  ],
                )
              ],
            ),
            SizedBox(height: 30.0),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.lock,
                  size: 22.0,
                  color: Colors.white,
                ),
                label: Text('Change Password',
                    style: TextStyle(fontSize: 22.0, color: Colors.white))),
            SizedBox(height: 20.0),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.star,
                  size: 22.0,
                  color: Colors.white,
                ),
                label: Text('Rate Bill Buddy',
                    style: TextStyle(fontSize: 22.0, color: Colors.white))),
            SizedBox(height: 20.0),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.question_mark,
                  size: 22.0,
                  color: Colors.white,
                ),
                label: Text('Contact Support',
                    style: TextStyle(fontSize: 22.0, color: Colors.white))),
            SizedBox(height: 20.0),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 22.0,
                  color: Colors.white,
                ),
                label: Text('Manage Notifications',
                    style: TextStyle(fontSize: 22.0, color: Colors.white))),
            SizedBox(height: 40.0),
            Center(
                child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
                size: 30.0,
              ),
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ))
          ],
        ),
      )
    ];
  }

  Widget groupDisplay(data) {
    return Builder(builder: (context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/home.jpg'),
                height: 90.0,
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'settled up',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.green,
                        fontWeight: FontWeight.w700),
                  ),
                  // Text(
                  //   'you owe \$10.9',
                  //   style: TextStyle(
                  //       fontSize: 18.0,
                  //       color: Colors.red[800],
                  //       fontWeight: FontWeight.w700),
                  // )
                ],
              ),
            ],
          ),
        );
      });
    });
  }

  AddGroupModal(BuildContext context) {
    final groupname = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    showGeneralDialog(
        context: context,
        pageBuilder: (context, __, ___) {
          selectedType = <bool>[false, false, false];
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Scaffold(
                backgroundColor: Colors.grey[900],
                appBar: AppBar(
                  backgroundColor: Colors.grey[850],
                  leading: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  title: Text(
                    "Create a group",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  elevation: 0.0,
                  actions: [
                    TextButton(
                        onPressed: () {
                          final isValid = _formKey.currentState!.validate();
                          if (isValid) {
                            group_data.add(groupname.text);
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: Color.fromARGB(255, 72, 151, 113),
                              fontSize: 20.0),
                        ))
                  ],
                ),
                body: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: groupname,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a valid group name!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 0.0),
                              border: UnderlineInputBorder(),
                              labelText: 'Group Name',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontStyle: FontStyle.italic),
                            ),
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'Type',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          SizedBox(height: 20.0),
                          ToggleButtons(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.flight_outlined, size: 30.0),
                                  SizedBox(width: 10.0),
                                  Text('Trip', style: TextStyle(fontSize: 20.0))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.home_outlined, size: 30.0),
                                  SizedBox(width: 10.0),
                                  Text('Home', style: TextStyle(fontSize: 20.0))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.menu, size: 30.0),
                                  SizedBox(width: 10.0),
                                  Text('Others',
                                      style: TextStyle(fontSize: 20.0))
                                ],
                              ),
                            ],
                            isSelected: selectedType,
                            borderColor: Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            selectedBorderColor: Colors.white,
                            selectedColor: Colors.white,
                            fillColor: Color.fromARGB(255, 58, 130, 95),
                            color: Colors.white,
                            constraints: const BoxConstraints(
                              minHeight: 50.0,
                              minWidth: 120.0,
                            ),
                            onPressed: (int index) {
                              setState(() {
                                for (int i = 0; i < selectedType.length; i++) {
                                  selectedType[i] = i == index;
                                }
                                print('Selected Type: $selectedType');
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 1.0,
        title: const Text(
          'Bill Buddy',
          style: TextStyle(
              color: Color.fromRGBO(239, 252, 255, 1),
              fontSize: 24.0,
              fontFamily: 'LibreBaskerville'),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_outlined,
                  color: Color.fromRGBO(239, 252, 255, 1), size: 30.0)),
        ],
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: _options.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[850],
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group_outlined,
                size: 35.0,
              ),
              label: 'Groups'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
                size: 35.0,
              ),
              label: 'Balance'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 35.0,
              ),
              label: 'Account')
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Color.fromRGBO(239, 252, 255, 1),
        unselectedItemColor: Color.fromRGBO(168, 166, 166, 1),
        onTap: onItemTapped,
      ),
    );
  }
}
