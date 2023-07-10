import 'package:flutter/material.dart';
import 'package:flutter_application_1/nav/utils/hot_deal_pics.dart';
import 'package:flutter_application_1/nav/utils/spacing.dart';


class HotDealsRow extends StatelessWidget {
  const HotDealsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hot Deals',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black87,
                    fontSize: 18.0,
                  ),
            ),
            addVerticalSpacing(16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: hotDealPics
                    .map(
                      (pic) => Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        width: 250,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(pic),
                              fit: BoxFit.fill,
                            )),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
