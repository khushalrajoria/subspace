import 'package:flutter/material.dart';

import '../constants/constants.dart';


class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.source,
    required this.category,
    required this.timeAgo,
  }) : super(key: key);

  final String image;
  final String title;
  final String source;
  final String category;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Image.network(image, fit: BoxFit.cover),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    source,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    // style: Theme.of(context).textTheme.caption,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: Text(
                      title,
                      // style: Theme.of(context).textTheme.headline6,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        category,
                        style: const TextStyle(color: primaryColor),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: grayColor,
                        ),
                      ),
                      Text(
                        timeAgo,
                        style: const TextStyle(color: grayColor),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
