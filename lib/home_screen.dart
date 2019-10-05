import 'package:flutter/material.dart';
import 'package:susil_travel_app/UserManagerImpl.dart';
import 'package:susil_travel_app/detail_screen.dart';
import 'Routhing.dart';


class HomeScreen extends StatelessWidget {
HomeScreen
  ({
    this.auth,
    this.onSignedOut,
  });
  final iUserManager auth;
  final VoidCallback onSignedOut;

  void _logoutUser() async
  {
    try
    {
      await auth.signOut();
      onSignedOut();
    } catch(e)
    {
      print("Error: " + e.toString());
    }
  }


  @override
Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: new BottomAppBar
    (
      color: Colors.black,
      child: new Container
      (

        margin: const EdgeInsets.only(left: 50.0, right: 50.0),

        child: new Row
        (
          mainAxisSize: MainAxisSize.max,

          children: <Widget>
          [
            new IconButton
            (
              icon: new Icon(Icons.arrow_back),
              iconSize: 50,
              color: Colors.white,
              onPressed: _logoutUser,
            ),

          

            
          ],

        ),
      ),
    ),


      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    'assets/flag.png',
                    width: 28.0,
                    height: 25.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    'Nepal',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30.0,
                        fontFamily: 'Cardo'),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Container(
                    width: 18.0,
                    height: 18.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 14.0,
                    )),
                  ),  
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text('Swayambhunath',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
              ),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text('When this temple was founded about 2000 years ago, Kathmandu valley was filled with a great lake, When this temple was founded about 2000 years ago.',
                    style: TextStyle(color: Colors.grey[20], fontSize: 14.0)),
              ),
              SizedBox(
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text('The lotus flower settled on top of the hill and magically transformed into the stupa. Thus it is known as the self-created (swayambhu) stupa.',
                    style: TextStyle(color: Colors.grey[20], fontSize: 14.0)),
              ),
              SizedBox(
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text('The location was originally known as Monkey Temple.',
                    style: TextStyle(color: Colors.grey[20], fontSize: 14.0)),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 350.0,
                      height: 280.0,
                    ),
                    Container(
                      width: 300.0,
                      height: 280.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/swayambhu.jpg'))),
                    ),
                    Positioned(
                      top: 120.0,
                      left: 230.0,
                      child: Material(
                        elevation: 8.0,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        child: Container(
                          width: 100.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.favorite, color: Colors.red),
                              Text('Like',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 16.0),
                child: Row(
                  children: <Widget>[
                    Text('Best Visit Nepal 2020',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cardo')),
                    SizedBox(width: MediaQuery.of(context).size.width - 270.0), 
                  ],
                ),
              ),
              //  Padding(
              //    padding: const EdgeInsets.only(top: 18.0, left: 18.0),
              // child:
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 18.0),
                child: SizedBox(
                  height: 250.0,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      cardItemWidget(context, 'assets/pic1.jpeg',
                          'Pashupatinath', '30 BOKING'),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                      ),
                      cardItemWidget(context, 'assets/lumbini.jpeg',
                          'Lumbini Palace', '62 BOKING'),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                      ),
                      cardItemWidget(context, 'assets/bunjeeJump.jpg',
                          'Pokhara Bunjee Jumping', '100 BOKING'),
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                      ),
                      cardItemWidget(context, 'assets/Dharahara.jpeg',
                          'Dharahara Tower', '20 BOKING'),
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                      ),
                      cardItemWidget(context, 'assets/AnnapurnaMassif.JPG',
                          'Annapurna Massif', '12 BOKING'),
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                      ),
                      cardItemWidget(context, 'assets/ChitwanNP.jpg',
                          'Chitwan National Park', '92 BOKING'),
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                      ),
                      cardItemWidget(context, 'assets/MT.Everest.jpeg',
                          'Mount Everest', '592 BOKING'),
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                      ),
                    ],
                  ),
                ),
              )
              //)
            ],
          )
        ],
      ),
    );
  }

 Widget cardItemWidget(
      BuildContext context, String image, String title, String bokingQty) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => DetailScreen(image, title)));
      }),
      child: Container(
        width: 250.0,
        height: 220.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 250.0,
                  height: 115.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(image))),
                ),
                Positioned(
                  left: 200,
                  top: 8.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '2.0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            //fontFamily: 'Cardo',
                            fontSize: 24.0),
                      ),
                      Text('KM',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18.0)),
                      SizedBox(
                        height: 25.0,
                      ),
                      Material(
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(40.0),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Colors.white,
                          ),
                          child: Center(
                            child:
                                Icon(Icons.favorite, color: Colors.grey[700]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 12.0),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ),
            circleWidgets(bokingQty),
          ],
        ),
      ),
    );
  }

  Widget circleWidgets(String bokingQty) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 12.0),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(color: Colors.white),
                    image: DecorationImage(
                        image: AssetImage('assets/sal1.jpeg'),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                left: 20.0,
                top: 1.0,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 16.0,
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      border: Border.all(color: Colors.white, width: 1.5),
                      image: DecorationImage(
                          image: AssetImage('assets/kat.jpeg'),
                          fit: BoxFit.cover)),
                ),
              ),
              // Positioned(
              //   left: 30.0,
              //   top: 1.0,
              //   child: Stack(
              //     children: <Widget>[
              //       Container(
              //         width: 30.0,
              //         height: 30.0,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(40.0),
              //             color: Colors.white),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          SizedBox(
            width: 90.0,
          ),
          Text(bokingQty, style: TextStyle(color: Colors.grey[20], fontSize: 18.0))
        ],
      ),
    );
  }
}
