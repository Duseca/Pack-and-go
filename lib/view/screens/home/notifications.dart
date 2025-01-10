import 'package:flutter/material.dart';

import 'package:pack_and_go/view/widgets/notificatrions_tile.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key, this.iscoach = false});
  final bool? iscoach;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Notifications'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7, // Adjust itemCount as needed
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NotificatrionsTile(
                      duration: 200 + (index * 200),
                      notificationType: index == 1
                          ? 'publish'
                          : index == 2
                              ? 'message'
                              : index == 3
                                  ? 'cancel'
                                  : index == 4
                                      ? 'review'
                                      : 'booking',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
