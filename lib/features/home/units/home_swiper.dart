part of '../home_view.dart';
class UserSwiper extends StatelessWidget {
  const UserSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/*
Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      child: Swiper(
        itemCount: 7,
        pagination: SwiperPagination(),
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
                left: 3,
                right: 3
            ),
            child: Container(
              height: 200,
              child: Image.asset(
                "images/swiper${index+1}.jpg",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                height: 190,
              ),
            ),
          );
        },
      ),
    )
 */
