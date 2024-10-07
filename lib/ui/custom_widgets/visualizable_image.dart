import 'package:flutter/material.dart';
import 'package:tirelist/ui/custom_widgets/image_visualizer_dialog.dart';

class VisualizableImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const VisualizableImage({
    required this.imageUrl,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ImageVisualizerDialog(imageUrl: imageUrl);
          },
        );
      },
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(right: 10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
