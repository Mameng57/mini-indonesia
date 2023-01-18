import 'package:flutter/material.dart';
import 'package:lovo_photography/models/description.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(this._size, this._color, this._description, {Key? key})
      : super(key: key);

  final Map<String, double> _size;
  final Color _color;
  final Description _description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: _size['width']! / 1.5,
      height: _size['height']! / 5,
      decoration: BoxDecoration(
        color: _color.withAlpha(100),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            width: _size['width']! / 5,
            height: _size['height']! / 15,
            image: AssetImage(
              _description.image,
            ),
          ),
          Text(
            _description.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 15,
              color: _color,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            _description.subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: _color,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
