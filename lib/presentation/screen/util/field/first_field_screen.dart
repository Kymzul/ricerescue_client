import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vhack_client/controller/service/location/location_service.dart';
import 'package:vhack_client/presentation/components/button/icon_button.dart';
import 'package:vhack_client/presentation/components/dialog/field/create_field_dialog.dart';
import 'package:vhack_client/presentation/components/textfield/search_textfield.dart';
import 'package:vhack_client/presentation/screen/bridge_screen.dart';
import 'package:vhack_client/shared/constant/custom_snackbar.dart';

import '../../../../shared/constant/custom_color.dart';
import '../../../../shared/constant/custom_textstyle.dart';
import '../../../components/button/icon_text_button.dart';
import '../../../components/button/text_button.dart';

class FirstFieldScreen extends StatefulWidget {
  const FirstFieldScreen({super.key});

  @override
  State<FirstFieldScreen> createState() => _FirstFieldScreenState();
}

class _FirstFieldScreenState extends State<FirstFieldScreen> {
  final TextEditingController tcSearch = TextEditingController();
  final TextEditingController tcFieldName = TextEditingController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng currentLatLng = const LatLng(3.221806, 101.725659);
  LatLng paddyLatLng = const LatLng(3.5543600622779796, 101.10060095787048);

  List<LatLng> listPoly = [];
  Set<Marker> listMarker = {};
  List<LatLng> emptyPoly = const [
    LatLng(3.221806, 101.725659),
  ];

  @override
  void dispose() {
    _disposeController();
    tcFieldName.dispose();
    tcSearch.dispose();
    super.dispose();
  }

  Future<void> _disposeController() async {
    final GoogleMapController controller = await _controller.future;
    controller.dispose();
  }

  void _handleMapTap(LatLng latLng) {
    setState(() {
      listPoly.add(latLng);
      _addMarker(latLng);
    });
  }

  void _addMarker(LatLng latLng) {
    final markerID = MarkerId(latLng.toString());
    final marker = Marker(
        markerId: markerID,
        position: latLng,
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: 'Marker at $latLng'));
    listMarker.add(marker);
  }

  void _handleMapUndo() {
    if (listPoly.isEmpty || listMarker.isEmpty) {
      SnackBarUtil.showSnackBar('Please Select The Point at least 2',
          CustomColor.getSecondaryColor(context));
    } else {
      setState(() {
        final lastMarker = listMarker.last;
        final lastPoly = listPoly.length - 1;
        listMarker.remove(lastMarker);
        listPoly.removeAt(lastPoly);
      });
    }
  }

  void showFieldDialog() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12))),
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            SizedBox(
                width: double.maxFinite,
                height: 450,
                child: SingleChildScrollView(
                    child: CreateFieldDialog(
                  tcFieldName: tcFieldName,
                  saveField: () {
                    if (listPoly.isEmpty) {
                      SnackBarUtil.showSnackBar('Please Draw The Field',
                          CustomColor.getSecondaryColor(context));
                      Navigator.pop(context);
                    } else {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const BridgeScreen(),
                          ),
                          (route) => false);
                    }
                  },
                ))),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.getBackgroundColor(context),
        appBar: buildAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: buildFloatButton(),
        body: FutureBuilder(
          future: LocationService.currentLocation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildContent(
                  LatLng(snapshot.data!.latitude, snapshot.data!.longitude));
            } else {
              return buildContent(currentLatLng);
            }
          },
        ));
  }

  AppBar buildAppBar() => AppBar(
        backgroundColor: CustomColor.getSecondaryColor(context),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('Draw Your Field',
            style: CustomTextStyle.getTitleStyle(
              context,
              18,
              CustomColor.getWhiteColor(context),
            )),
        actions: [
          IconButton(
              onPressed: () {
                _handleMapUndo();
              },
              icon: Icon(
                Icons.undo,
                color: CustomColor.getWhiteColor(context),
              ))
        ],
      );

  Widget buildFloatButton() => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () {
            showFieldDialog();
          },
          child: Icon(
            Icons.add,
            color: CustomColor.getWhiteColor(context),
          ),
        ),
      );

  Widget buildContent(LatLng latLng) => Stack(
        children: [buildGoogleMap(latLng), buildSearchBar()],
      );

  GoogleMap buildGoogleMap(LatLng latLng) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: paddyLatLng, zoom: 20),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      onTap: (LatLng latLng) {
        _handleMapTap(latLng);
      },
      mapType: MapType.satellite,
      polygons: {
        Polygon(
            polygonId: const PolygonId('_id'),
            points: listPoly.isEmpty ? emptyPoly : listPoly,
            fillColor: Colors.blue.withOpacity(0.2),
            strokeColor: Colors.blue,
            geodesic: true,
            strokeWidth: 4),
      },
      markers: listMarker,
    );
  }

  Widget buildSearchBar() => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Row(
          children: [
            Expanded(
              child: SearchTextfield(
                title: 'Search',
                tcSearch: tcSearch,
                onChanged: (p0) {},
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColor.getSecondaryColor(context)),
                  child: Icon(
                    Icons.search,
                    color: CustomColor.getWhiteColor(context),
                  )),
            )
          ],
        ),
      );
}
