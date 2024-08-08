import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'bloc_detailView.dart';
import 'constants.dart';
import 'news_card.dart'; // Import the NewsCard widget
import 'skeleton.dart'; // Import the Skeleton widget

class BlogListView extends StatefulWidget {
  @override
  _BlogListViewState createState() => _BlogListViewState();
}

class _BlogListViewState extends State<BlogListView> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 17, 19, 100),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 17, 19, 100),
        title: const Text('SubSpace', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _isLoading
            ? ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) => const BlogCardSkeleton(),
                separatorBuilder: (context, index) => const SizedBox(height: defaultPadding),
              )
            : BlocBuilder<BlogBloc, BlogState>(
                builder: (context, state) {
                  if (state is BlogLoaded) {
                    return ListView.separated(
                      itemCount: state.blogs.length,
                      itemBuilder: (context, index) {
                        final blog = state.blogs[index];
                        return GestureDetector(
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
                            timeAgo:  "Just now",
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: defaultPadding),
                    );
                  } else if (state is BlogError) {
                    return const Center(child: Text('Failed to load blogs'));
                  } else {
                    return Container();
                  }
                },
              ),
      ),
    );
  }
}

class BlogCardSkeleton extends StatelessWidget {
  const BlogCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Skeleton(height: 100, width: 100),
        SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(width: 120),
              SizedBox(height: defaultPadding / 2),
              Skeleton(),
              SizedBox(height: defaultPadding / 2),
              Skeleton(),
              SizedBox(height: defaultPadding / 2),
              Row(
                children: [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
