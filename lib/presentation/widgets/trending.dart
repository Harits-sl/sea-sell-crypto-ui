import 'package:flutter/material.dart';
import 'package:sea_sell_crypto/presentation/pages/bid_detail_page.dart';
import 'package:sea_sell_crypto/shared/theme.dart';

class Trending extends StatefulWidget {
  final String? imageUrl;

  const Trending({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  /// variabel unutk button love
  late bool _isWishlist;

  @override
  void initState() {
    _isWishlist = false;
    super.initState();
  }

  void onTapButtonWishlist() => setState(() {
        _isWishlist = !_isWishlist;
      });

  void routeToDetailBid() => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BidDetailPage()),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // _shadow(),
        _buildTrending(context),
        // _buttonTrending(context),
      ],
    );
  }

  Widget _shadow() => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 270,
            height: 115,
            decoration: BoxDecoration(
              boxShadow: [
                primaryBoxSadow,
              ],
            ),
          ),
        ),
      );

  Widget _buttonTrending(BuildContext context) => Positioned.fill(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 18,
                ),
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  'Trending',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 14,
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 55,
                      ),
                    ),
                    onPressed: routeToDetailBid,
                    child: Text(
                      'Bid now',
                      style: brownTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: onTapButtonWishlist,
                    child: _isWishlist
                        ? Image.asset(
                            'assets/btn_wishlist_full.png',
                            width: 40,
                          )
                        : Image.asset(
                            'assets/btn_wishlist.png',
                            width: 40,
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _imageCover() => ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Image.asset(
          widget.imageUrl!,
          width: 270,
          height: 340,
          fit: BoxFit.cover,
        ),
      );

  Widget _buildTrending(context) => Stack(
        children: [
          _shadow(),
          _imageCover(),
          _buttonTrending(context),
        ],
      );
}
