import 'package:flutter/material.dart';
import 'package:pack_and_go/view/widgets/booking_tile.dart';
import 'package:pack_and_go/view/widgets/request_history_tile.dart';

class AllRequests extends StatelessWidget {
  const AllRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  padding: EdgeInsets.all(0),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RequestHistoryTile();
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
