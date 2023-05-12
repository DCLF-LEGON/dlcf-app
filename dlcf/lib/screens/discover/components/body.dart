import 'package:dlcf/api/models.dart';
import 'package:dlcf/screens/discover/components/suggestion_box.dart';
import 'package:flutter/material.dart';

class DiscoverBody extends StatelessWidget {
  const DiscoverBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Message> suggestions = [
      Message(
        id: 1,
        title: "The Power of Gratitude",
        preacher: "John Doe",
        thumbnailUrl: "https://example.com/image1.jpg",
        description:
            "In this sermon, we explore the transformative power of gratitude in our lives.",
        url: "n_FIQxyWkWc",
      ),
      Message(
        id: 2,
        title: "Overcoming Fear and Anxiety",
        preacher: "Jane Smith",
        thumbnailUrl: "https://example.com/image2.jpg",
        description:
            "Join us as we learn how to overcome fear and anxiety with faith and courage.",
        url: "GkJz8QfCOmA",
      ),
      Message(
        id: 3,
        title: "Living a Life of Purpose",
        preacher: "Mark Johnson",
        thumbnailUrl: "https://example.com/image3.jpg",
        description:
            "Discover the keys to living a life of purpose and fulfillment in this inspiring sermon.",
        url: "ippQJgBCXjk",
      ),
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Quick Suggestions',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              filled: false,
              hintText: 'Search',
              suffixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 10),
          suggestions.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: suggestions.length,
                  itemBuilder: (context, index) {
                    return SuggestionBox(
                      title: suggestions[index].title,
                      preacher: 'Ps. Dr. W.F. Kumuyi',
                      thumbnailUrl: suggestions[index].thumbnailUrl,
                      description: suggestions[index].description,
                      url: suggestions[index].url,
                    );
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(height: 50),
                      Icon(
                        Icons.not_interested,
                        size: 40,
                        color: Colors.grey,
                      ),
                      Text(
                        'No Suggestions Found',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
