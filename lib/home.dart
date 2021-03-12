import 'package:flutter/material.dart';
import 'package:google_task/res.dart';
import 'package:google_task/sheets/add_bottom_sheet.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

homeAppBar() {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(
        left: padding38,
        top: padding28,
      ),
      child: Text(
        'My Tasks',
        style: TextStyle(
          color: myTaskTextColor,
          fontSize: textSize34,
          fontFamily: 'Product Sans',
        ),
      ),
    ),
    backgroundColor: scaffoldBackgroundColor,
    toolbarHeight: toolbarHeight70,
    elevation: 0,
  );
}

homeFloatingActionButton(BuildContext buildContext) {
  return FloatingActionButton(
    onPressed: () => showModalBottomSheet(
      context: buildContext,
      builder: (build) => AddBottomSheet(),
      backgroundColor: Colors.transparent,
    ),
    child: Icon(
      Icons.add,
      size: iconSize42,
      color: saveButtonColor,
    ),
    backgroundColor: scaffoldBackgroundColor,
  );
}

homeFloatingActionButtonLocation() {
  return FloatingActionButtonLocation.centerDocked;
}

homeBottomNavigationBar() {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    notchMargin: 6,
    color: scaffoldBackgroundColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
    ),
  );
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      floatingActionButton: homeFloatingActionButton(context),
      floatingActionButtonLocation: homeFloatingActionButtonLocation(),
      bottomNavigationBar: homeBottomNavigationBar(),
    );
  }
}
