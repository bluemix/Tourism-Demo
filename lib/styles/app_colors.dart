

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'package:flutter/widgets.dart';

BoxDecoration gradientBackDecoration() {
  return const BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: const <Color>[
        Color(0xffF55B9A), // <color name="violet_red">#F55B9A</color>
        Color(0xffF9B16E), // <color name="rajah">#F9B16E</color>
      ],
    ),
  );
}

BoxDecoration cardGradientBackground() {
  return const BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: const <Color>[
        Color(0xffF1EEE7), // <color name="alabaster">#F1EEE7</color>
        Color(0xffF8FAF9), // <color name="hint_of_red">#F8FAF9</color>
      ],
    ),
  );
}


class AppColors {
  static var primaryBackgroundColor = Colors.white;    // <color name="blue_lagoon">#005F79</color>
  static var secondaryBackgroundColor = new Color(0xFF458BA3);  //<color name="boston_blue">#458BA3</color>

  static var primaryTextColor = tuftsBlueColor;        // <color name="crimson">#DD153D</color>
  static var secondaryTextColor = armadilloColor;        // <color name="scarlett">#802028</color>
  static var tertiaryTextColor = stormGrayColor;

  static var accentColor = roseOfSharonColor;               // <color name="fuzzy_wuzzy_brown">#D36A76</color>
  static var almondColor = new Color(0xFFEFDDCC);               // <color name="almond">#EFDDCC</color>
  static var rodeoDustColor = new Color(0xFFCEAFA0);               // <color name="rodeo_dust">#CEAFA0</color>

  static var chardonnayColor = new Color(0xFFFFD189);   //<color name="chardonnay">#FFD189</color>
  static var whiteLinen = new Color(0xFFFBF3EA);                // <color name="white_linen">#FBF3EA</color>
  static var zigguratLinenColor = new Color(0xFF86A7AE);                // <color name="ziggurat">#86A7AE</color>
  static var towerGrayColor = new Color(0xFFA3BABF);                // <color name="tower_gray">#A3BABF</color>
  static var mineShaftColor = new Color(0xFF362E32);                // <color name="mine_shaft">#362E32</color>
  static var bunkerColor = new Color(0xFF5F5C5F);                // <color name="bunker">#2C2C2E</color>
  static var charcoalColor = new Color(0xFF464646);                // <color name="charcoal">#464646</color>
  static var solitudeColor = new Color(0xFFE8EDF4);                // <color name="solitude">#E8EDF4</color>
  static var dartElectricBlueColor = new Color(0xFF54657C);        // <color name="dark_electric_blue">#54657C</color>
  static var frenchGrayColor = new Color(0xFFB8BFC9);        // <color name="french_gray">#B8BFC9</color>
  static var osloGrayColor = new Color(0xFF838C9B);        // <color name="oslo_gray">#838C9B</color>
  static var oilColor = new Color(0xFF323232);        // <color name="oil">#323232</color>
  static var slateGrayColor = new Color(0xFF6E7F93);        // <color name="slate_gray">#6E7F93</color>
  static var zirconColor = new Color(0xFFE1E5E9);        // <color name="zircon">#E1E5E9</color>
  static var cadetBlueColor = new Color(0xFFA9B7C4);        // <color name="cadet_blue">#A9B7C4</color>
  static var linkWaterColor = new Color(0xFFC7D2DB);        // <color name="link_water">#C7D2DB</color>
  static var koromikoColor = new Color(0xFFFFC765);        // <color name="koromiko">#FFC765</color>



  static var mercuryColor = new Color(0xFFE4E4E4);                // <color name="mercury">#E4E4E4</color>
  static var whiteColor = new Color(0xFFFFFFFF);                // <color name="mercury">#E4E4E4</color>

  static var mysticColor = new Color(0xFFE5E9EC);                //<color name="mystic">#E5E9EC</color>
  static var aluminiumColor = new Color(0xFF84878C);                //<color name="aluminium">#84878C</color>
  static var loblollyColor = new Color(0xFFB6BABE);                //<color name="loblolly">#B6BABE</color>
  static var tuftsBlueColor = new Color(0xFF3D77C4);                //<color name="tufts_blue">#3D77C4</color>
  static var alabasterColor = new Color(0xFFF1EEE7);           //<color name="alabaster">#F1EEE7</color>
  static var chicagoColor = new Color(0xFF625E5B);           //<color name="chicago">#625E5B</color>

  static var darkGrayColor = new Color(0xFFA8A8A8);           //<color name="dark_gray">#A8A8A8</color>
  static var armadilloColor = new Color(0xFF4A4A4A);           //<color name="armadillo">#4A4A4A</color>
  static var stormGrayColor = new Color(0xFF76797E);           //<color name="storm_gray">#76797E</color>

  static var roseOfSharonColor = new Color(0xFFB74927);           //<color name="rose_of_sharon">#B74927</color>


}