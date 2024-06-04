import 'dart:async';
import 'package:flutter/material.dart';

class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  late PageController _pageController;
  int activePage = 0;

  late Timer _timer;
  bool timerActive = false;

  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: activePage,
    );
    _startTime();
    super.initState();
  }

  void _startTime() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (timerActive) {
        if (activePage < images.length - 1) {
          activePage++;
        } else {
          activePage = 0;
        }
        _pageController.animateToPage(
          activePage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  List<Widget> indicators(int imagesLength, int currentIndex) {
    return List<Widget>.generate(
      imagesLength,
      (index) {
        bool isIndicatorSelected = currentIndex == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: const EdgeInsets.all(3),
          width: isIndicatorSelected ? 12 : 10,
          height: isIndicatorSelected ? 12 : 10,
          decoration: BoxDecoration(
            color: isIndicatorSelected ? Colors.black : Colors.black26,
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                activePage = currentIndex;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: images.length,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              pageSnapping: true,
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;

                return _CarouselSlider(
                  images: images,
                  pagePosition: pagePosition,
                  active: active,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage),
          ),
          Center(
            child: IconButton(
              onPressed: () {
                setState(() {
                  timerActive = !timerActive;
                });
              },
              icon: timerActive
                  ? const Icon(
                      Icons.pause,
                      size: 30,
                      color: Colors.black26,
                    )
                  : const Icon(
                      Icons.play_arrow,
                      size: 30,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CarouselSlider extends StatelessWidget {
  const _CarouselSlider({
    required this.images,
    required this.pagePosition,
    required this.active,
  });

  final List<String> images;
  final int pagePosition;
  final bool active;

  @override
  Widget build(BuildContext context) {
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            images[pagePosition],
          ),
        ),
      ),
    );
  }
}