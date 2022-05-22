import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          CarouselSlider(items:
          [
            Image.network("https://img.freepik.com/free-psd/summer-sales-social-media-posts_23-2149015987.jpg?t=st=1650461718~exp=1650462318~hmac=eb2fe6b7fcd58b8a6ea5417124a409f52b1be61f487a847481963a484988b7db&w=740"),
            Image.network("https://img.freepik.com/free-psd/3d-objects-laptop-black-friday_129606-71.jpg?w=740"),
            Image.network("https://img.freepik.com/free-vector/home-catalog-social-media-instagram-post-banner-template_80983-1329.jpg?w=740"),
            Image.network("https://img.freepik.com/free-vector/pack-sale-books-banners_23-2147658906.jpg?t=st=1650464828~exp=1650465428~hmac=7576ae2e92a7133290bb26c7403df4edfa917040b827c0b27cd425143e0445e4&w=740"),
          ], options: CarouselOptions(
            height: 250  ,
            autoPlay: true,
            scrollDirection: Axis.horizontal,
           enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 1,

          ))
        ],
      );
  }
}
