import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'bloc_detailView.dart';
import 'news_card.dart'; // Import the NewsCard widget

class BlogListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 17, 19, 100),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 17, 19, 100),
        title: const Text('SubSpace', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
      ),
      body: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BlogLoaded) {
            return ListView.builder(
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                final blog = state.blogs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogDetailView(blog: blog),
                        ),
                      );
                    },
                    child: NewsCard(
                      image: blog.imageUrl,
                      title: blog.title,
                      source: "Unknown Source",
                      category:  "General",
                      timeAgo: "Just now",
                    ),
                  ),
                );
              },
            );
          } else if (state is BlogError) {
            return const Center(child: Text('Failed to load blogs'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
