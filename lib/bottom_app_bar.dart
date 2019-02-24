import 'package:flutter/material.dart';

class FloatingBottomBar extends StatefulWidget {
  final VoidCallback onTap;

  FloatingBottomBar({ this.onTap });
  @override
  FloatingBottomBarState createState() {
    return new FloatingBottomBarState();
  }
}

class FloatingBottomBarState extends State<FloatingBottomBar> {
  Color get _selectedColor => Colors.deepPurple[600];
  int _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height * .12,
              child: CustomPaint(
                painter: CurvedBarPainter(),
                child: _buildButtonBar()
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            // left: 0.0,
            // right: 0.0,
            // Uso un translate porque si lo centro con el positiones, el tap del FAB ocupaba todo el espacio
            child: Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * .36, 0.0),
              child: FloatingActionButton(
                backgroundColor: _selectedColor,
                onPressed: widget.onTap,
                child: Icon(Icons.gps_fixed),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildTabButton(
            onTap: () => setState(()=> _selectedTab = 0),
            icon: Icons.home,
            label: 'HOME',
            index: 0
          ),
          SizedBox(),
          _buildTabButton(
            onTap: () => setState(()=> _selectedTab = 1),
            icon: Icons.laptop_mac,
            label: 'TAB 1',
            index: 1
          )
        ],
      ),
    );
  }

  Color _getColor(int index) {
    if (_selectedTab == index) return _selectedColor;

    return Colors.white;
  }

  Widget _buildTabButton({VoidCallback onTap, IconData icon, String label, int index}) {
    return Material(
      color: Colors.transparent,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: onTap,
        child: Container(
          height: 70.0,
          width: 70.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, color: _getColor(index)),
              SizedBox(height: 2.0),
              Text(label, style: TextStyle(
                color: _getColor(index)
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint() 
    ..color = Color(0XFFED8080).withOpacity(1);

    Path path = Path();
    path.lineTo(0.0, size.height * .58);
    path.quadraticBezierTo(size.width * .01, size.height * .95 , size.width * .15, size.height);
    path.lineTo(size.width * .85, size.height);
    path.quadraticBezierTo(size.width * .99, size.height * .95 , size.width, size.height * .6);
    path.lineTo(size.width, size.height * .2);
    path.quadraticBezierTo(size.width * .99, size.height * -.02, size.width * .9, 0.0);
    path.lineTo(size.width * .8, 0.0);
    path.quadraticBezierTo(size.width * .7, size.height * .01, size.width * .65, size.height * .3);
    path.quadraticBezierTo(size.width * .5, size.height , size.width * .35, size.height * .3);
    path.quadraticBezierTo(size.width * .3, size.height * .01, size.width * .2, 0.0);
    path.lineTo(size.width * .1, 0.0);
    path.quadraticBezierTo(size.width * .01, size.height * -.02, 0.0, size.height * .2);

    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}

