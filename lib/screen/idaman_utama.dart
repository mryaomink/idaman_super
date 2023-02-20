import 'package:flutter/material.dart';
import 'package:idaman_bjb/widget/banjartv_card.dart';
import 'package:idaman_bjb/widget/idaman_destination.dart';
import 'package:idaman_bjb/widget/idaman_slider.dart';
import 'package:idaman_bjb/widget/layanan_widget.dart';
import 'package:idaman_bjb/widget/media_center.dart';
import 'package:idaman_bjb/widget/menu_gridview.dart';

import '../widget/header_yao.dart';

class IdamanUtama extends StatelessWidget {
  const IdamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderYao(),
              IdamanSlider(),
              SizedBox(
                height: 15.0,
              ),
              BanjarTvCard(),
              SizedBox(
                height: 15.0,
              ),
              LayananWidget(),
              Divider(
                thickness: 10,
                color: Color(0xffECECEC),
              ),
              MediaCenter(),
              SizedBox(
                height: 20.0,
              ),
              MenuGridview(),
              Divider(
                thickness: 10,
                color: Color(0xffECECEC),
              ),
              IdamanDestination(),
            ],
          ),
        ),
      ),
    );
  }
}
