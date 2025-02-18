import 'package:flutter/material.dart';
import 'package:pack_and_go/view/screens/history/all.dart';
import 'package:pack_and_go/view/widgets/tabs_widget.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

final List<String> _tabs = ['All', 'On Going', 'Cacelled', 'Completed'];
int _currentIndex = 0;
final List<Widget> tabBarView = [
  All(),
  All(),
  All(),
  All(),
];

class _MyBookingsState extends State<MyBookings> {
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TabsWidget(
                currentindex: _currentIndex,
                items: _tabs,
                isexpanded: false,
                ontap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              )),
          Expanded(
            child: IndexedStack(
              children: tabBarView,
              index: _currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}
