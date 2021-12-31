import 'package:flutter/material.dart';
import 'package:sea_sell_crypto/shared/theme.dart';

class RecentBid extends StatelessWidget {
  const RecentBid({
    Key? key,
    this.imageUrl,
    this.coin,
    this.date,
    this.value,
  }) : super(key: key);

  final String? imageUrl;
  final String? coin;
  final String? date;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imageUrl!,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin!,
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    date!,
                    style: grayTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Image.asset('assets/ic_btc.png', width: 22),
              const SizedBox(width: 5),
              Text(
                value!.toStringAsFixed(2),
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
