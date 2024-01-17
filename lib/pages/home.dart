import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
      Center()
    ];
  }

  Widget groupDisplay(data) {
    return Card(
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(5.0))),
      color: Color.fromRGBO(239, 252, 255, 1),
      margin: EdgeInsets.fromLTRB(16.0, 25.0, 16.0, 0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image(
              image: AssetImage('assets/money.jpg'),
              height: 90.0,
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'settled up',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.green[900],
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
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue[900],
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
        backgroundColor: Colors.blue[900],
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group_outlined,
                // color: Color.fromRGBO(168, 166, 166, 1),
                size: 35.0,
              ),
              label: 'Groups'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
                // color: Color.fromRGBO(168, 166, 166, 1),
                size: 35.0,
              ),
              label: 'Balance'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                // color: Color.fromRGBO(168, 166, 166, 1),
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
