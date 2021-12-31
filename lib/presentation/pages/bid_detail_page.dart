import 'package:flutter/material.dart';
import 'package:sea_sell_crypto/shared/theme.dart';

class BidDetailPage extends StatelessWidget {
  const BidDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildTitleAndImage(),
            _buildSetAndPlaceBid(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndImage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Text(
              'Warehouse',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Text(
                'Menggambarkan betapa pentingnya sebuah persediaan',
                textAlign: TextAlign.center,
                style: grayTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Stack(
              children: [
                Positioned.fill(
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
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Image.asset(
                    'assets/detail1.png',
                    width: 270,
                    height: 340,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSetAndPlaceBid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Text(
          'Set Bid',
          style: blackTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 277,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            border: Border.all(color: lightGrayColor),
          ),
          child: TextField(
            style: brownTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  top: 7,
                  bottom: 7,
                  left: 7,
                  right: 10,
                ),
                child: Image.asset('assets/ic_btc.png', width: 26),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: yellowColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              // horizontal: 277 / 4,
            ),
            minimumSize: const Size(277, 40),
          ),
          onPressed: () {},
          child: Text(
            'Place Bid',
            style: brownTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 52),
      ],
    );
  }
}
