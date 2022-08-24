part of '../home_view.dart';
class CategoryWidget extends StatelessWidget {
  Category category ;
  CategoryWidget({Key? key , required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        try{
          await CategoryScreenUseCase.get(context).filterProductWithHighPrice(id: category.id);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => CategoryScreen(category: category)
              )
          );
        }on FirebaseException catch (e){
          print(e.message.toString());
        }
      },
      child: Container(
        width: UserResponsive.get(
            context: context,
            mobile: MediaQuery.of(context).size.width * 0.25,
            tablet: UserResponsive.width(context) * 0.27
        ),
        height: MediaQuery.of(context).size.width * 0.25,
        margin: EdgeInsets.all(3.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: MediaQuery.of(context).size.width * 0.20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      category.image,
                    ),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ) ,
            Padding(
              padding: EdgeInsets.only(top: 5.sp),
              child: Text(
                category.name,
                style: UserTheme.get(
                    context: context,
                    fontWight: FontWeight.w700,
                    fontSize: 13.sp,
                    colorBright:AppColor.black,
                    colorDark:  Colors.grey.shade200
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
