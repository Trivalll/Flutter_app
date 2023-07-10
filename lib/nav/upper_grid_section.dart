import 'package:flutter/material.dart';
import 'package:flutter_application_1/nav/utils/spacing.dart';

import 'carousel.dart';
import 'option_card.dart';

class UpperGridSection extends StatelessWidget {
  const UpperGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyCarousel(
                images: ['lib/images/white.jpeg', 'lib/images/green.jpeg'],
              ),
            ],
          ),
          addHorizontalSpacing(20.0),
          Column(
            children: const <Widget>[
              
              
            ],
          ),
        ],
      ),
    );
  }
}
