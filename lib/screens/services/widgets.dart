import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:service_pap/utils/utils.dart';
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
  final Function onSearch;

  const BottomBar({Key key, @required this.onSearch}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState(onSearch: onSearch);
}

class _BottomBarState extends State<BottomBar> {
  bool _expanded = false;
  FocusNode _searchFocusNode;
  double _containerWidth = 110.0;
  final _buttonsPadding = 8.0;
  final _buttonBackgroundColor = Colors.white;
  final _expandAnimationOffset = Duration(milliseconds: 250);
  final _expandAnimationDuration = Duration(milliseconds: 250);
  final Function onSearch;

  _BottomBarState({@required this.onSearch});

  void _shrinkContainer() {
    setState(() {
      _expanded = false;
      _containerWidth = 110.0;

      Future.delayed(_expandAnimationDuration + _expandAnimationOffset, () {
        _searchFocusNode.unfocus();
      });
    });
  }

  void _expandContainer(context) {
    setState(() {
      _expanded = true;
      _containerWidth = getAvailableWidth(context);

      Future.delayed(_expandAnimationDuration + _expandAnimationOffset, () {
        _searchFocusNode.requestFocus();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NeumorphicStyle _buttonsStyle = NeumorphicStyle(
      color: _buttonBackgroundColor,
      padding: const EdgeInsets.all(6),
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

    return AnimatedContainer(
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 250),
      width: _containerWidth,
      decoration: BoxDecoration(
          color: _buttonBackgroundColor,
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
          Expanded(
            child: AnimatedCrossFade(
              duration: Duration(milliseconds: 250),
              crossFadeState: _expanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Padding(
                  padding: EdgeInsets.all(_buttonsPadding),
                  child: NeumorphicButton(
                    child: Icon(Icons.search),
                    style: _buttonsStyle,
                    onTap: () => _expandContainer(context),
                  ),
                ),
              ),
              secondChild: NeumorphicTextField(
                hint: 'Search for service...',
                focusNode: _searchFocusNode,
                onChanged: onSearch,
                style: NeumorphicStyle(
                  padding: EdgeInsets.only(left: 8.0),
                ),
                button: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => _shrinkContainer(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_buttonsPadding),
            child: NeumorphicButton(
              child: Icon(MdiIcons.filter),
              style: _buttonsStyle,
            ),
          ),
        ],
      ),
    );
  }
}
