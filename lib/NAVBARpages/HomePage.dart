
/*import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/NAVBARpages/MainPage2But.dart';



class HomePage extends StatefulWidget {

  HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SearchController=TextEditingController();
List<String> BooksIDs = [];

Future getBooksIDs()async{
  await FirebaseFirestore.instance.collection('booksURL').get().then((snapshot) => 
  snapshot.docs.forEach((document) {
    BooksIDs.add(document.reference.id);
  }));

}


@override
  Widget build(BuildContext context) {
     /*Scaffold(    
      backgroundColor:  Color.fromARGB(255, 211, 90, 181),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Expanded(
                  child: FutureBuilder(
                    builder:(context,snapshot){
                      return   ListView.builder(
                  itemCount: BooksIDs.length,
                  itemBuilder: (context,index)
                 {
                  return ListTile(
                    title: Column(
                      children: [
                        Text(BooksIDs[index]),
                       
                      ],
                    ),
                  );
                 }
                 );
                 }, future:getBooksIDs() ,
                 )
                 )   
              ]
              
            ),
          ),
          
    );
    
        
       
     
  }
}*/


   return Scaffold(
 appBar: AppBar(
  actions: <Widget>[
    Padding(
      padding: const EdgeInsets.only(),
      child: IconButton(
        icon: Icon(
          Icons.person,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MainPage2()));
        },
      ),
    )
  ],
  backgroundColor: Color.fromARGB(255, 211, 90, 181),
),
 body: Container(
  color: Color.fromARGB(255, 211, 90, 181),
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: OptionCard(
              label: data[index].title,
              imageUrl: data[index].image,
            ),
          );
        },
        childCount: data.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 16 / 8,
      ),
    );
 ),
  );
}
}
 */
import 'package:flutter/material.dart';
import 'package:flutter_application_1/nav/hot_deals_row.dart';
import 'package:flutter_application_1/nav/promotion_carousel.dart';


import '../nav/option_card_grid.dart';
import '../nav/upper_grid_section.dart';
import 'MainPage2But.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scrollController;
  EdgeInsetsGeometry _titlePadding = const EdgeInsets.only(bottom: 40.0);
  bool _centerTitle = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50) {
        setState(() {
          _centerTitle = false;
          _titlePadding = const EdgeInsets.only(bottom: 18.0, left: 32.0);
        });
      } else {
        setState(() {
          _centerTitle = true;
          _titlePadding = const EdgeInsets.only(bottom: 40.0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
  actions: <Widget>[
    Padding(
      padding: const EdgeInsets.only(),
      child: IconButton(
        icon: Icon(
          Icons.person,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MainPage2()));
        },
      ),
    )
  ],
      ),
      backgroundColor: Colors.grey[200],
     
      body: Padding(
        padding: const EdgeInsets.only(top:10),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const UpperGridSection(),
            const OptionCardGrid(),
            const HotDealsRow(),
            const PromotionCarousel(),
          ],
        ),
      ),
    );
  }
}
