import 'package:flutter/material.dart';

class SelectableImageBox extends StatefulWidget {
  const SelectableImageBox({
    required this.imageTitle,
    required this.imageUrl,
    required this.isSelected,
    required this.selectedHandler,
    required Key key,
  }) : super(key: key);

  final String imageTitle;
  final String imageUrl;
  final bool isSelected;
  final ValueChanged<bool> selectedHandler;

  @override
  State<SelectableImageBox> createState() => _SelectableImageBoxState();
}

class _SelectableImageBoxState extends State<SelectableImageBox> {
  late bool isSelected = widget.isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.selectedHandler(isSelected);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        color: isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.secondary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Image(
                  width: double.maxFinite,
                  height: 90,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  image: NetworkImage(widget.imageUrl),
                ),
                isSelected
                ? Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                )
                : const SizedBox(),
              ],
            ),
            Text(
              widget.imageTitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary
              ),
            ),
          ],
        ),
      ),
    );
  }
}
