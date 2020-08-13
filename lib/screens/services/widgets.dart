import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:service_pap/widgets/neumorphism/neumorphism.dart';

class RatingStars extends StatelessWidget {
  final rating;

  RatingStars({this.rating: 5.0});

  Widget _buildStars() {
    List<Widget> _builtStars = [];

    for (var i = 1; i <= 5; ++i) {
      _builtStars.add(
        Icon(
          i <= rating
              ? Icons.star
              : ((i - 1) < rating && rating < i)
                  ? Icons.star_half
                  : Icons.star_border,
          size: 14.0,
          color: rating > 4
              ? Colors.green[600]
              : rating > 2 ? Colors.orange[600] : Colors.red[600],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: _builtStars,
        ),
        const SizedBox(width: 18.0),
        Text(
          "$rating",
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildStars();
  }
}

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _bottomButtonBackgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    NeumorphicStyle _bottomButtonsStyle = NeumorphicStyle(
      color: _bottomButtonBackgroundColor,
      radius: BorderRadius.circular(10.0),
      shadows: [
        BoxShadow(
          color: Colors.white,
          offset: Offset(-3, -2),
          blurRadius: 5,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          offset: Offset(3, 3),
          blurRadius: 10,
          spreadRadius: 5,
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: _bottomButtonBackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 0),
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ]),
      child: Row(
        children: <Widget>[
          NeumorphicButton(
            child: Icon(Icons.search),
            style: _bottomButtonsStyle,
          ),
          SizedBox(width: 15),
          NeumorphicButton(
            child: Icon(MdiIcons.filter),
            style: _bottomButtonsStyle,
          ),
        ],
      ),
    );
  }
}
