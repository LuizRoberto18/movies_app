import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaskedImage extends StatelessWidget {
  final String? asset;
  final String? mask;

  const MaskedImage({Key? key, this.asset, this.mask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return FutureBuilder<List>(
          future: _createShaderAndImage(asset ?? "", mask ?? "", constraints.maxWidth, constraints.maxHeight),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return const SizedBox.shrink();
            return ShaderMask(
              blendMode: BlendMode.dstATop,
              shaderCallback: (rect) => snapshot.data![0],
              child: snapshot.data![1],
            );
          },
        );
      },
    );
  }

  Future<List> _createShaderAndImage(
    String asset,
    String mask,
    double width,
    double height,
  ) async {
    ByteData data = await rootBundle.load(asset);
    ByteData maskData = await rootBundle.load(asset);

    Codec codec = await instantiateImageCodec(
      maskData.buffer.asUint8List(),
      targetWidth: width.toInt(),
      targetHeight: height.toInt(),
    );
    FrameInfo fi = await codec.getNextFrame();
    ImageShader shader = ImageShader(
      fi.image,
      TileMode.clamp,
      TileMode.clamp,
      Matrix4.identity().storage,
    );
    Image image = Image.memory(
      data.buffer.asUint8List(),
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
    return [shader, image];
  }
}
