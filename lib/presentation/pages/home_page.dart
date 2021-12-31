import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sea_sell_crypto/presentation/widgets/avatar_creator.dart';
import 'package:sea_sell_crypto/presentation/widgets/recent_bid.dart';
import 'package:sea_sell_crypto/presentation/widgets/trending.dart';
import 'package:sea_sell_crypto/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  /// variabel untuk menampung url gambar untuk digunakan di carousel
  final List listCarouselImageUrl = const [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];

  /// variabel untuk menampung url gambar untuk digunakan di popular creator
  final List listCreatorImageUrl = const [
    'assets/profile1.png',
    'assets/profile2.png',
    'assets/profile3.png',
    'assets/profile4.png',
    'assets/profile5.png',
    'assets/profile6.png',
  ];

  /// varibel untuk recent bids berupa array objek
  final List<Map<String, dynamic>> listRecentBids = const [
    {
      'imageUrl': 'assets/recent_bid1.png',
      'coin': 'Dart Celline',
      'date': 'Apr 22',
      'value': 28.40,
    },
    {
      'imageUrl': 'assets/recent_bid2.png',
      'coin': 'Zipzip Koin',
      'date': 'Feb 31',
      'value': 1.10,
    },
    {
      'imageUrl': 'assets/recent_bid3.png',
      'coin': 'Dart Celline',
      'date': 'Feb 9',
      'value': 590.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildAppBar(),
                _buildTrendingCarousel(),
                _buildPopularCreator(),
                _buildRecentBid(),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildBottomNavigationBar(context),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(context) {
    return Container(
      width: MediaQuery.of(context).size.width - (defaultMargin * 2),
      height: 56,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: darkBlueColor,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/ic_profile.png', width: 24),
          Image.asset('assets/ic_news.png', width: 24),
          Image.asset('assets/ic_dashboard.png', width: 24),
          Image.asset('assets/ic_collection.png', width: 24),
          Image.asset('assets/ic_help.png', width: 24),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    Widget _titleAndSubTitle() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SeaSell',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Find Your NFTs Today',
              style: grayTextStyle.copyWith(
                fontWeight: light,
                fontSize: 16,
              ),
            ),
          ],
        );

    Widget _iconCartAndNotif() => Row(
          children: [
            Image.asset(
              'assets/ic_cart.png',
              width: 24,
            ),
            const SizedBox(width: 8),
            Image.asset(
              'assets/ic_notif.png',
              width: 24,
            ),
          ],
        );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _titleAndSubTitle(),
          _iconCartAndNotif(),
        ],
      ),
    );
  }

  Widget _buildTrendingCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 360,
        viewportFraction: 0.77,
        initialPage: 1,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        // autoPlay : true,
      ),
      items: listCarouselImageUrl.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Trending(imageUrl: imageUrl);
          },
        );
      }).toList(),
    );
  }

  Widget _buildPopularCreator() {
    /// index untuk margin avatar
    int _index = 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // kurang 20 karena carousel height ditambah 20
        const SizedBox(height: 30),
        Container(
          padding: EdgeInsets.only(left: defaultMargin, bottom: 16),
          child: Text(
            'Popular Creators',
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: 55,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: listCreatorImageUrl.map((imageUrl) {
              _index++;

              return Container(
                margin: EdgeInsets.only(
                  left: _index == 1 ? defaultMargin : 12,
                  right:
                      _index == listCreatorImageUrl.length ? defaultMargin : 0,
                ),
                child: AvatarCreator(
                  imageUrl: imageUrl,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentBid() {
    /// variabel untuk margin widget bid
    int _index = 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: defaultMargin),
          child: Text(
            'My Recent Bids',
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listRecentBids.map((bid) {
            _index++;

            return Container(
              margin: EdgeInsets.only(
                bottom: _index != listRecentBids.length ? 0 : 135,
              ),
              child: RecentBid(
                imageUrl: bid['imageUrl'],
                coin: bid['coin'],
                date: bid['date'],
                value: bid['value'],
              ),
            );
          }).toList(),
        ),
        // Bid(),
        // Bid(),
        // Bid(),
      ],
    );
  }
}
