import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_flutter/detail/view/detail_page.dart';
import 'package:cat_flutter/home/bloc/home_bloc.dart';
import 'package:cat_flutter/utils/extensions/sizebox.dart';
import 'package:cat_repository/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatCard extends StatelessWidget {
  const CatCard({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<dynamic>(
            builder: (context) => DetailPage(cat: cat),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16, left: 1, right: 1),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                cat.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              16.0.heightBox,
              FutureBuilder(
                future: context.read<HomeBloc>().getImage(cat.referenceImageId),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    final url = snapshot.data as String;
                    cat.image = url;
                    return CachedNetworkImage(
                      imageUrl: url,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress)),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Failed cat image 😿');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              16.0.heightBox,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      cat.origin,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  10.0.widthBox,
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Intelligence: ',
                        children: [
                          TextSpan(
                            text: '${cat.intelligence}',
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
