import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({
    super.key,
    required this.currentindex,
    this.ontap,
    required this.items,
  });

  final int currentindex;
  final void Function(int)? ontap; // Allow ontap to receive the index
  final List<String> items;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

int current = 0;

class _TabsWidgetState extends State<TabsWidget> {
  void _onTap(int index) {
    if (widget.ontap != null) {
      widget.ontap!(index); // Pass index to ontap callback
    } else {
      setState(() {
        current = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 4),
        decoration: rounded2r(kGrey1Color, kGrey1Color, 100),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: List.generate(
                  widget.items.length,
                  (index) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            _onTap(index), // Call _onTap with the index
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: AnimatedContainer(
                            padding: EdgeInsets.all(8),
                            duration: const Duration(milliseconds: 300),
                            height: Get.height,
                            decoration: BoxDecoration(
                              gradient: widget.currentindex == index
                                  ? bggrad()
                                  : null,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                color: widget.currentindex == index
                                    ? ktransparent
                                    : kGrey2Color,
                              ),
                            ),
                            child: Center(
                              child: MyText(
                                text: widget.items[index],
                                paddingLeft: 16,
                                paddingRight: 16,
                                size: 13,
                                weight: FontWeight.w600,
                                color: widget.currentindex == index
                                    ? kPrimaryColor
                                    : kBlackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
