import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vhack_client/presentation/components/image/mynetwork_image.dart';

import '../../../../shared/constant/custom_color.dart';
import '../../../../shared/constant/custom_textstyle.dart';
import '../../../components/card/service/shop_service_card.dart';
import '../../../components/card/service/user_service_card.dart';
import '../user/user_detail_screen.dart';

class ServiceShopScreen extends StatefulWidget {
  const ServiceShopScreen({super.key});

  @override
  State<ServiceShopScreen> createState() => _ServiceShopScreenState();
}

class _ServiceShopScreenState extends State<ServiceShopScreen> {
  List<Map<String, dynamic>> productList = [
    {
      'productImage':
          'https://store.aonic.com/image/poladrone/image/cache/data/all_product_images/product-601/New%20Assortment%20(March)%20(41)-1000x1000.jpg',
      'productTitle': 'CARBON FIBER TUBE 25/20MM (1 METER) [AONIC POLADRONE]',
      'productPrice': 'RM70.00',
    },
    {
      'productImage':
          'https://store.aonic.com/image/poladrone/image/cache/data/all_product_images/product-434/New%20Assortment%20(March)%20(35)-1000x1000.png',
      'productTitle':
          'DRONE MERACUN 10/16/20L 4/6KIPAS Y SHAPED NOZZLE EXTENSION 1PCS EP GX DRONE CUSTOM SPARE PART [AONIC POLADRONE]',
      'productPrice': 'RM50.00 - RM60.00',
    },
    {
      'productImage':
          'https://store.aonic.com/image/poladrone/image/cache/data/all_product_images/product-472/New%20Assortment%20(March)%20(31)-1000x1000.jpg',
      'productTitle':
          'EFT EP WATER TANK 16L STANDARD / EFT EP 16L WATER TANK COMPLETE SET [AONIC POLADRONE]',
      'productPrice': 'RM230.00',
    },
    {
      'productImage':
          'https://store.aonic.com/image/poladrone/image/cache/data/all_product_images/product-480/U4-HP-800x800.jpg',
      'productTitle':
          'EV PEAK U4-HP AGRICULTURE DRONE BATTERY CHARGER 100V-240V DRONE MERACUN 10/16/20/30L 4/6KIPAS DRONE CUSTOM [AONIC POLADRONE]',
      'productPrice': 'RM1,855.00',
    },
    {
      'productImage':
          'https://store.aonic.com/image/poladrone/image/cache/data/all_product_images/product-350/Skydroid%20RC-1000x1000.jpg',
      'productTitle':
          'SKYDROID T12 REMOTE CONTROLLER & FPV SPOTLIGHT [AONIC POLADRONE]',
      'productPrice': 'RM775.00',
    },
    {
      'productImage':
          'https://store.aonic.com/image/poladrone/image/cache/data/all_product_images/product-646/Mist%20Drone%20(15)-1000x1000.png',
      'productTitle':
          'MIST LITE AGRICULTURE SPRAYING DRONE E616P BRUSHLESS PUMP TYPE 16L TANK EFT SKYDROID H12 [AONIC POLADRONE]',
      'productPrice': 'M25,000.00',
    },
  ];

  List listChip = [
    ['Organic', false],
    ['Machinery', false]
  ];

  void setSelected(bool value, int index) {
    setState(() {
      listChip[index][1] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.getBackgroundColor(context),
        appBar: buildAppBar(),
        body: Column(
          children: [
            buildListChip(),
            const SizedBox(
              height: 10,
            ),
            buildListShopCard()
          ],
        ));
  }

  AppBar buildAppBar() => AppBar(
        backgroundColor: CustomColor.getSecondaryColor(context),
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          'Shop',
          style: CustomTextStyle.getTitleStyle(
              context, 18, CustomColor.getWhiteColor(context)),
        ),
      );

  Widget buildListChip() => Padding(
        padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
        child: SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listChip.length,
            itemBuilder: (context, index) {
              String eachChip = listChip[index][0];
              bool eachSelected = listChip[index][1];
              return buildChip(eachChip, eachSelected, index);
            },
          ),
        ),
      );

  Widget buildChip(String eachChip, bool eachSelected, int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ChoiceChip(
          label: Text(eachChip),
          labelStyle: CustomTextStyle.getTitleStyle(
              context,
              12,
              eachSelected
                  ? CustomColor.getWhiteColor(context)
                  : CustomColor.getTertieryColor(context)),
          backgroundColor: Colors.black26,
          selectedColor: CustomColor.getSecondaryColor(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          selected: eachSelected,
          onSelected: (value) {
            setSelected(value, index);
          },
        ),
      );

  Widget buildListShopCard() => Expanded(
        child: GridView.builder(
          itemCount: productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.75),
          itemBuilder: (context, index) {
            return buildShopCard(productList[index]);
          },
        ),
      );

  Widget buildShopCard(final shopEntity) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ShopServiceCard(shopEntity: shopEntity));
}
