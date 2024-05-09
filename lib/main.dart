import 'package:flutter/material.dart';
import 'package:zavod_it/history.dart';
import 'package:zavod_it/maps.dart';
import 'package:zavod_it/profile.dart';
import 'package:zavod_it/support.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerItems.maps;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerItems.maps) {
      container = MapsPage();
    } else if (currentPage == DrawerItems.profile) {
      container = ProfilePage();
    } else if (currentPage == DrawerItems.support) {
      container = SupportPage();
    } else if (currentPage == DrawerItems.history) {
      container = HistoryPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(
          child: Text(
            "Zavod-IT",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: container,
      drawer: SafeArea(
        child: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: MenuList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected,
      BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          onTap(id);
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                    icon,
                    size: 20,
                    color: Colors.black87,
                  )
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget MenuList() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          menuItem(1, "Maps", Icons.map,
              currentPage == DrawerItems.maps ? true : false, context),
          menuItem(2, "Profile", Icons.people,
              currentPage == DrawerItems.profile ? true : false, context
          ),
          menuItem(3, "Support", Icons.support,
              currentPage == DrawerItems.support ? true : false, context
          ),
          menuItem(4, "History", Icons.book,
              currentPage == DrawerItems.history ? true : false, context
          ),
        ],
      ),
    );
  }

  void onTap(int id) {
    setState(() {
      if(id == 1) {
        currentPage = DrawerItems.maps;
      } else if(id == 2) {
        currentPage = DrawerItems.profile;
      } else if(id == 3) {
        currentPage = DrawerItems.support;
      } else if(id == 4) {
        currentPage == DrawerItems.history;
      }
    });
  }
}

enum DrawerItems {
  profile,
  support,
  history,
  maps,
}

