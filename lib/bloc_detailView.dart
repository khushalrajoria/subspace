import 'package:flutter/material.dart';
import 'services/bloc_services.dart';

class BlogDetailView extends StatelessWidget {
  final Blog blog;

  BlogDetailView({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Image.asset('assets/images/logo.png', fit: BoxFit.cover),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(blog.imageUrl),
            SizedBox(height: 16.0),
            Text(blog.title, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
