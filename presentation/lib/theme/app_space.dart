import 'package:flutter/material.dart';

abstract class AppSpace {
  AppSpace._();

  ///40
  static double get xlg => 40;

  ///32
  static double get lg => 32;

  ///24
  static double get def => 24;

  ///16
  static double get md => 16;

  ///12
  static double get smd => 12;

  ///8
  static double get sm => 8;

  ///4
  static double get xsm => 4;
}

abstract class AppSpaceBox {
  AppSpaceBox._();

  ///40
  static SizedBox get xlg =>
      SizedBox(width: AppSpace.xlg, height: AppSpace.xlg);

  ///32
  static SizedBox get lg => SizedBox(width: AppSpace.lg, height: AppSpace.lg);

  ///24
  static SizedBox get def =>
      SizedBox(width: AppSpace.def, height: AppSpace.def);

  ///16
  static SizedBox get md => SizedBox(width: AppSpace.md, height: AppSpace.md);

  ///12
  static SizedBox get smd =>
      SizedBox(width: AppSpace.smd, height: AppSpace.smd);

  ///8
  static SizedBox get sm => SizedBox(width: AppSpace.sm, height: AppSpace.sm);

  ///4
  static SizedBox get xsm =>
      SizedBox(width: AppSpace.xsm, height: AppSpace.xsm);
}
