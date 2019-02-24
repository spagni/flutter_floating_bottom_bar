import 'package:flutter/material.dart';
import 'background_curves.dart';
import 'bottom_app_bar.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
        textTheme: Typography(platform: TargetPlatform.iOS).white
      ),
      home: SafeArea(
        child: Scaffold(
          body: Builder(
            builder: (BuildContext context) => Stack(
              children: <Widget>[
                BackgroundCurves(),
                _buildAppbar(),
                _buildContentList(context),
                _buildBottomBar(context)
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget _buildAppbar() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: 12.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Home', style: TextStyle(
                  fontSize: 40.0,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w700
                )),
                Text('Welcome back, Sebastian', style: TextStyle(
                  fontSize: 15
                ))
              ],
            ),
            CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/11.jpg'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContentList(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .22,
      bottom: 12.0,
      left: 0.0,
      right: 0.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: <Widget>[
            _buildTransactionButton(context),
            _buildCard(),
            _buildCard(),
            _buildCard(),
            _buildCard(),
            _buildCard(),
            _buildCard(),
            SizedBox(height: 150.0)
          ],
        )
      )
    );
  }

  Widget _buildCard() {
    return Card(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: EdgeInsets.only(top: 16.0),
      child: Container(
        height: 150.0,
        child: Placeholder(color: Colors.teal),
      ),
    );
  }

  Widget _buildTransactionButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: StadiumBorder(),
        onTap: (){},
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.black12)
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 8.0,),
              Icon(Icons.monetization_on, color: Colors.pink[200]),
              SizedBox(width: 8.0,),
              Expanded(child: Text('2 new transactions', style: TextStyle(
                color: Colors.black54
              ))),
              Transform.rotate(
                angle: -45.55,
                child: Icon(Icons.arrow_downward, color: Colors.black45),
              ),
              SizedBox(width: 8.0)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Positioned(
      bottom: 24.0,
      left: 24.0,
      right: 24.0,
      child: FloatingBottomBar(
        onTap: () => print('FAB TAPPED')
      )
    );
  }
}