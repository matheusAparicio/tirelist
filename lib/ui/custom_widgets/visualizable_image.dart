import 'package:flutter/material.dart';

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
