import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_flutter/utils/extensions/sizebox.dart';
import 'package:cat_repository/cat_repository.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: cat.image,
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Center(
            child:
                CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cat.description, style: const TextStyle(fontSize: 16)),
                8.0.heightBox,
                const Divider(),
                8.0.heightBox,
                const Text(
                  'Country',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                3.0.heightBox,
                Text(cat.origin, style: const TextStyle(fontSize: 16)),
                16.0.heightBox,
                const Text(
                  'Intelligence',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                3.0.heightBox,
                Text(cat.intelligence.toString(),
                    style: const TextStyle(fontSize: 16)),
                16.0.heightBox,
                const Text(
                  'Adaptability',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                3.0.heightBox,
                Text(cat.adaptability.toString(),
                    style: const TextStyle(fontSize: 16)),
                16.0.heightBox,
                const Text(
                  'Life span',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                3.0.heightBox,
                Text('${cat.lifeSpan} years',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
