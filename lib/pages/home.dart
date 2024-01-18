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

  @override
  void initState() {
    super.initState();
    group_data = ['GHC', 'St.Augustine', 'Pensacola', 'Home'];

    _options = [
      Center(
        child: Column(
          children: [
            Column(
              children: group_data.map((data) => groupDisplay(data)).toList(),
            ),
            SizedBox(height: 25.0),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.group_add_outlined,
                color: Colors.black,
                size: 30.0,
              ),
              label: Text(
                'Start a new group',
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
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
                  backgroundImage: AssetImage('assets/profilephoto3.jpg'),
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
          )
        ],
      ),
    );
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
