import 'package:flutter/material.dart';
import 'package:service_pap/utils/variables.dart';

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
          size: 16.0,
          color: primaryColor,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 5),
        Row(
          children: _builtStars,
        ),
        // Text(
        //   "$rating",
        //   style: TextStyle(fontSize: 18.0),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildStars(),
      ],
    );
  }
}
