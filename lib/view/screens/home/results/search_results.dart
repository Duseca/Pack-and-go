import 'package:flutter/material.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/home/results/requests.dart';
import 'package:pack_and_go/view/screens/home/results/trips.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';
import 'package:pack_and_go/view/widgets/tabs_widget.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<String> _tabs = ['Trips', 'Requests'];
  final List<Widget> tabBarView = [
    Trips(),
    Requests(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Results', actions: [
            CommonImageView(
              imagePath: Assets.imagesFilter,
              height: 24,
            ),
            SizedBox(
              width: 20,
            )
          ]),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TabsWidget(
                currentindex: _currentIndex,
                items: _tabs,
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
