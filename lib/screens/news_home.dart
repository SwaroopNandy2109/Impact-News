import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/api/top_news_api.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/response.dart';
import 'package:news_app/screens/webview_page.dart';

class TopHeadlinesPage extends StatefulWidget {
  @override
  _TopHeadlinesPageState createState() => _TopHeadlinesPageState();
}

class _TopHeadlinesPageState extends State<TopHeadlinesPage> {
  String error = "Nothing caught";
  Response _response;
  int selectedIndex = 0;
  bool loading = false;
  List<String> categories = [
    'General',
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  @override
  void initState() {
    fetchTopHeadlinesFromApi();
    super.initState();
  }

  fetchTopHeadlinesFromApi() async {
    setState(() {
      loading = true;
    });
    Response response = await getTopHeadlines();
    setState(() {
      _response = response;
      loading = false;
    });
  }

  fetchTopHeadlinesByCategoryApi(String category) async {
    setState(() {
      loading = true;
    });
    Response response = await getTopHeadlinesByCategory(category: category);
    setState(() {
      _response = response;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Top Headlines"),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              tooltip: "Reload",
              icon: Icon(
                Icons.refresh,
                size: 30,
              ),
              onPressed: () =>
                  fetchTopHeadlinesByCategoryApi(categories[selectedIndex]),
            )
          ],
        ),
        body: Column(
          children: [
            buildUpperCategoriesContainer(),
            Expanded(
              child: loading ? buildLoadingIndicator() : buildNewsListView(),
            )
          ],
        ),
      ),
    );
  }

  buildDebugText() {
    return Text("Error message from api" +
        _response.message +
        "\nError in try-catch " +
        error);
  }

  buildLoadingIndicator() {
    return Center(
        child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.black),
    ));
  }

  buildUpperCategoriesContainer() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(color: Colors.grey),
        ),
      ),
      child: buildListView(),
    );
  }

  buildListView() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => buildListItem(index),
        separatorBuilder: (_, __) => SizedBox(width: 10),
        itemCount: categories.length);
  }

  buildNewsListView() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemBuilder: (_, index) => buildNewsListItem(_response.articles[index]),
        separatorBuilder: (_, __) => SizedBox(height: 10),
        itemCount: _response.articles.length);
  }

  buildNewsListItem(Article article) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => WebViewPage(url: article.url))),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Image.network(article.urlToImage),
              SizedBox(height: 14),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  article.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      article.source.name,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text("- ${Jiffy(article.publishedAt).fromNow()}")
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  buildListItem(int index) {
    return FlatButton(
      color: selectedIndex == index ? Colors.white : Colors.black,
      splashColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      onPressed: () {
        fetchTopHeadlinesByCategoryApi(categories[index].toLowerCase());
        setState(() => selectedIndex = index);
      },
      child: Text(
        categories[index],
        style: TextStyle(
          color: selectedIndex != index ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
