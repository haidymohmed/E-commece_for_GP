part of '../home_view.dart';

// ignore: must_be_immutable
class SectionTitle extends StatelessWidget {
  String title ;
  String? trailing;
  bool isTrailing = false;
  // ignore: prefer_typing_uninitialized_variables
  var onTap ;
  SectionTitle({Key? key , required this.title , this.trailing , required this.isTrailing , this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: MediaQuery.of(context).size.width ,
        padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
            vertical: 5.sp
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.tajawal(
                fontSize: UserResponsive.get(
                    context: context,
                    mobile: 15.sp,
                    tablet: 13.sp
                ),
                fontWeight: FontWeight.w700,
              ),
            ),
            isTrailing ?
            InkWell(
              onTap: (){
                onTap();
              },
              child: Text(
                trailing!,
                style: GoogleFonts.tajawal(
                  fontSize: UserResponsive.get(
                      context: context,
                      mobile: 13.sp,
                      tablet: 13.sp
                  ),
                ),
              ),
            )
                :
            const SizedBox(width: 10,)
          ],
        )
    );
  }
}
