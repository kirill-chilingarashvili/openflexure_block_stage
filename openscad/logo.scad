/******************************************************************
*                                                                 *
* OpenFlexure Microscope: WaterScope logo                         *
*                                                                 *
* This file draws the WaterScope logo.                            *
*                                                                 *
* This is part of the OpenFlexure microscope, an open-source      *
* microscope and 3-axis translation stage.  It gets really good   *
* precision over a ~10mm range, by using plastic flexure          *
* mechanisms.                                                     *
*                                                                 *
* WaterScope is a company that uses the microscope, and will      *
* hopefully sell it quite soon.                                   *
*                                                                 *
* (c) Richard Bowman, January 2016                                *
* Released under the CERN Open Hardware License                   *
*                                                                 *
******************************************************************/

use <utilities.scad>;

$fn=64;

module waterscope_logo(){
    difference(){
        //eye shape
        intersection(){
            translate([0,13,0]) cylinder(r=30,h=1);
            translate([0,-13,0]) cylinder(r=30,h=1);
        }
        
        //tear-drop shaped pupil
        difference(){
            translate([0,-((12-1)*sqrt(2)+1 - 12)/2,0]) hull(){
                cylinder(r=12,h=999,center=true);
                translate([0,(12-1)*sqrt(2),0])cylinder(r=1,h=999,center=true);
            }
            
            //tick
            translate([2,-11,0]) sequential_hull(){
                translate([-3,3,0]) cylinder(r=1,h=1);
                translate([0,0,0]) cylinder(r=1,h=1);
                translate([6,6,0]) cylinder(r=1,h=1);
            }
        }
    }
}

module oshw_logo(){
    linear_extrude(1) translate([-17.5,-16]) resize([35,0],auto=true) import("oshw_gear.dxf");
}

module logo_and_name(subtitle=""){
    union(){
        waterscope_logo();
        
        translate([30,-6,0]) linear_extrude(1){
            text("WaterScope", size=15, font="Calibri");
        }
        translate([110,-17,0]) linear_extrude(1){
            text(subtitle, size=9, font="Calibri", halign="right");
        }
    }
}

logo_and_name("v5.15.2-LS-M");
translate([0,-40,0]) oshw_logo();