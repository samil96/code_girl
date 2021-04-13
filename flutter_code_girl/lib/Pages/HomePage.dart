import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_girl/Util/Keys.dart';
//import 'package:flutter_code_girl/Util/SizingInfo.dart';
import 'package:flutter_code_girl/Values/ResponsiveApp.dart';
import 'package:flutter_code_girl/Widget/Header.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollPosition = 0;
  double _opacity = 0;

  AutoScrollController autoScrollController;
  //ocultar el boton flotante y aparecer
  bool _isVisible = false;
  //hacer los diseños responsivos
  ResponsiveApp responsiveApp;

  _scrollListener() {
    //escuchar cada vez que se hace scroll
    setState(() {
      _scrollPosition = autoScrollController.position.pixels;
    });
  }

  @override
  void initState() {
    //inicializar el scroll
    autoScrollController = AutoScrollController(
      //add this for advanced viewport boundary. e.g. SafeArea
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
    autoScrollController.addListener(_scrollListener);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);
    //_scrollPosition esta en pixeles
    _opacity = _scrollPosition < responsiveApp.opacityHeight
        ? _scrollPosition / responsiveApp.opacityHeight
        : 1;

    _isVisible = _scrollPosition >= responsiveApp.menuHeight;
    return Scaffold(
      //la llave poder modificar los elemntos del scafold
        key: homeScaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: Visibility(
          visible: _isVisible,
          child: FloatingActionButton(
            onPressed: () => {
              autoScrollController.scrollToIndex(0)},
            child:  Icon(Icons.arrow_upward),
          ),
        ),
        appBar: Header(_opacity)
   /*isMobileAndTablet(context)
            ? ShopAppBar(_opacity)
            : Header(_opacity),
        drawer: ShopDrawer(),
        body: ListView(controller: autoScrollController, children: [
          Carousel(),
         isMobileAndTablet(context)
              ? MenuTap()
              : SectionListView(autoScrollController),
          isMobileAndTablet(context) ? SizedBox.shrink() : Footer()
        ])*/
        );
  }
}