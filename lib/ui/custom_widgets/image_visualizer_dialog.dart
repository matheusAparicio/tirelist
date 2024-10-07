import 'package:flutter/material.dart';

class ImageVisualizerDialog extends StatelessWidget {
  final String imageUrl;
  const ImageVisualizerDialog({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Image.network(
            imageUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
