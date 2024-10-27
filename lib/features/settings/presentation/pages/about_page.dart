import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/core/widgets/app_bar_back.dart';
import 'package:malahi_app/core/widgets/background_app.dart';
import 'package:malahi_app/core/widgets/buttton_primary.dart';
import 'package:malahi_app/core/widgets/buttton_secondary.dart';
import 'package:malahi_app/core/widgets/header_h1.dart';
import 'package:malahi_app/core/widgets/logo_app.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            BackgroundApp(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LogoApp(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'assets/images/onboarding1.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // HeaderH1(text: 'من نحن'),
                SizedBox(height: 16),
                Text(
                  'من نحن',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'ولكن في ظروف معينة وبسبب ادعاءات الواجب أو التزامات العمل ، سيحدث في كثير من الأحيان أنه يجب نبذ الملذات وقبول الإزعاج. لذلك يتمسك الرجل الحكيم دائمًا في هذه الأمور بمبدأوهو نفس القول من خلال الانكماش من الكد والألم. هذه الحالات بسيطة للغاية وسهلة التمييز',
                  // textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'ولكن في ظروف معينة وبسبب ادعاءات الواجب أو التزامات العمل ، سيحدث في كثير من الأحيان أنه يجب نبذ الملذات وقبول الإزعاج. لذلك يتمسك الرجل الحكيم دائمًا في هذه الأمور بمبدأوهو نفس القول من خلال الانكماش من الكد والألم. هذه الحالات بسيطة للغاية وسهلة التمييز',
                  // textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                /* SizedBox(height: 16),
                HeaderH1(text: 'اتصل بنا'),
                Text(
                  'لكن يجب أن أشرح لك كيف ولدت كل هذه الفكرة',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                ButtonSecondary(
                  icon: Icons.phone,
                  backgroundColor: Color(0xff25D366),
                  borderColor: Color(0xff25D366),
                  text: '0021332432432', // Button text
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                ButtonSecondary(
                  backgroundColor: Color(0xff25D366),
                  borderColor: Color(0xff25D366),
                  icon: Icons.phone,
                  text: '0021332432432', // Button text
                  onPressed: () {},
                ), */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
