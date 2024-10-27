import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/core/widgets/app_bar_back.dart';
import 'package:malahi_app/core/widgets/background_app.dart';
import 'package:malahi_app/core/widgets/buttton_primary.dart';
import 'package:malahi_app/core/widgets/buttton_secondary.dart';
import 'package:malahi_app/core/widgets/header_h1.dart';
import 'package:malahi_app/core/widgets/logo_app.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            BackgroundApp(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'سياسة الخصوصية',
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
                /* LogoApp(),
                HeaderH1(text: 'سياسة الخصوصية'),
                SizedBox(height: 16),
                Text(
                  textAlign: TextAlign.center,
                  'ولكن في ظروف معينة وبسبب ادعاءات الواجب أو التزامات العمل ، سيحدث في كثير من الأحيان أنه يجب نبذ الملذات وقبول الإزعاج. لذلك يتمسك الرجل الحكيم دائمًا في هذه الأمور بمبدأوهو نفس القول من خلال الانكماش من الكد والألم. هذه الحالات بسيطة للغاية وسهلة التمييز',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  textAlign: TextAlign.center,
                  'ولكن في ظروف معينة وبسبب ادعاءات الواجب أو التزامات العمل ، سيحدث في كثير من الأحيان أنه يجب نبذ الملذات وقبول الإزعاج. لذلك يتمسك الرجل الحكيم دائمًا في هذه الأمور بمبدأوهو نفس القول من خلال الانكماش من الكد والألم. هذه الحالات بسيطة للغاية وسهلة التمييز',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'ولكن في ظروف معينة وبسبب ادعاءات الواجب أو التزامات العمل ، سيحدث في كثير من الأحيان أنه يجب نبذ الملذات وقبول الإزعاج. لذلك يتمسك الرجل الحكيم دائمًا في هذه الأمور بمبدأوهو نفس القول من خلال الانكماش من الكد والألم. هذه الحالات بسيطة للغاية وسهلة التمييز',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 26),
                ButtonPrimary(
                  text: 'تواصل معنا', // Button text
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                ), */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
