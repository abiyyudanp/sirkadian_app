import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/hexcolor_controller.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    Key? key,
    required this.color,
    required this.name,
    required this.necessity,
    required this.serving,
    required this.recommendationScore,
    required this.duration,
    required this.containerButton,
    required this.iconButton,
    required this.icon,
    required this.depth,
    required this.imageFilename,
  }) : super(key: key);

  final ColorConstantController color;
  final String name;
  final String necessity;
  final String serving;
  final String recommendationScore;
  final String duration;

  final IconData icon;
  final double depth;
  final String imageFilename;
  final Function() containerButton;
  final Function() iconButton;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: containerButton,
      padding: EdgeInsets.all(0),
      style: NeumorphicStyle(
          color: color.bgColor,
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(20),
          )),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Stack(alignment: Alignment.bottomRight, children: [
        Row(
          children: [
            Container(
                height: 120.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: color.backupPrimaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: imageFilename == ''
                    ? Icon(Icons.image_not_supported_rounded)
                    : Image.network(
                        imageFilename,
                        fit: BoxFit.cover,
                      )),
            SizedBox(
              width: 10.w,
            ),
            //segment 2
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200.w,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: color.primaryTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.fire,
                          color: color.redColor,
                          size: 12.sp,
                        ),
                        Text(
                          ' ' + necessity + ' kkal',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: color.secondaryTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    Text(' | '),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: color.blueColor,
                          size: 12,
                        ),
                        Text(
                          ' ' + duration + ' min',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: color.secondaryTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    Text(' | '),
                    Text(
                      serving + ' Porsi',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: color.secondaryTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        //segment 3
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20.w, bottom: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    color: color.yellowColor,
                    size: 12,
                  ),
                  Text(
                    ' ' + recommendationScore,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: color.secondaryTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20.w, bottom: 20.h),
              child: NeumorphicButton(
                onPressed: iconButton,
                style: NeumorphicStyle(
                  depth: depth,
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.circle(),
                  color: color.bgColor,
                ),
                padding: EdgeInsets.all(10.sp),
                child: FaIcon(
                  icon,
                  size: 12.sp,
                  color: color.secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
