import 'package:dlcf/screens/home/components/video_body.dart';
import 'package:flutter/material.dart';

class LiveStreamBody extends StatefulWidget {
  const LiveStreamBody({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LiveStreamBodyState createState() => _LiveStreamBodyState();
}

class _LiveStreamBodyState extends State<LiveStreamBody> {
  List<dynamic> categories = [];
  List<dynamic> streamData = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchLiveStreamData();
  }

  fetchLiveStreamData() async {
    setState(() {
      isLoading = true;
    });

    // delay for 3 secs
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : categories.isNotEmpty
              ? VideoBody(
                  title: streamData[0]['title'],
                  url: streamData[0]['video_id'],
                  description: streamData[0]['description'],
                  preacher: 'Pastor Dr. W. F. Kumuyi',
                  thumbnailUrl: '',
                )
              : const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.live_tv_rounded,
                        size: 70,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No Live Stream Available',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
