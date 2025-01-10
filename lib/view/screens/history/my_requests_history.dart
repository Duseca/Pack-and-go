import 'package:flutter/material.dart';
import 'package:pack_and_go/view/screens/history/all_requests.dart';

import '../../widgets/tabs_widget.dart';

class MyRequestsHistory extends StatefulWidget {
  const MyRequestsHistory({super.key});

  @override
  State<MyRequestsHistory> createState() => _MyRequestsHistoryState();
}

final List<String> _tabs = ['All', 'On Going', 'Cacelled', 'Completed'];
int _currentIndex = 0;
final List<Widget> tabBarView = [
  AllRequests(),
  Container(),
  Container(),
  Container()
];

class _MyRequestsHistoryState extends State<MyRequestsHistory> {
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
