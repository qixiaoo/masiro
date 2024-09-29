import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CachedImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      fit: fit,
      progressIndicatorBuilder: (context, url, progress) {
        return Container(
          color: Colors.black45,
          child: Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          color: Colors.black45,
          child: const Center(
            child: Icon(Icons.error),
          ),
        );
      },
    );
  }
}
