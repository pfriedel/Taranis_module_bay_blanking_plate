width=48.2;
height=64.1;

int_width=44.2;
int_height=60.1;
int_depth = 10;

translate([0,18.55,7]) {
  difference(){
    union() {
      rotate([90,0,0]) {  cylinder(d=14, h=27, $fn=100, center=true); }
      translate([0,0,-3.5]) cube([14,27,7], true);  
    }
    translate([0, 10, 0]) { rotate([90,0,0]) { cylinder(d=6.4, h=10, $fn=100, center=true); } }
    rotate([90,0,0]) { cylinder(d=10, h=25, $fn=100, center=true); }
    translate([0,0,-3.6]) { cube([10,25,7], true); }
  }
}

difference() {
  union() {
    //wings
    cube([width+6.5,18.12,2], true);
    
    //plate
    cube([width,height,2], true);
  }
  
  translate([0,18.55,0]) { cube([10,25,7], true); }
  
  translate([0,-(height/2)+15,0]) { cylinder(d=10, h=50, $fn=100, center=true); } // bind button

  translate([-(width/2),-(height/2),0]) { rotate([0,0,45]) { cube([4,4,4], true); } } // knock off the corner
  translate([-(width/2), (height/2),0]) { rotate([0,0,45]) { cube([4,4,4], true); } } // knock off the corner
  translate([ (width/2),-(height/2),0]) { rotate([0,0,45]) { cube([4,4,4], true); } } // knock off the corner
  translate([ (width/2), (height/2),0]) { rotate([0,0,45]) { cube([4,4,4], true); } } // knock off the corner

  // right hand pinholes
  translate([(int_width/2)-2, (int_height/2)-2,0]) { cylinder(h=50, d=2.1, $fn=100, center=true); }
  translate([(int_width/2)-2, (int_height/2)-2,.5]) { cylinder(h=1.01, d=6.1, $fn=100, center=true); }

  translate([(int_width/2)-2, -(int_height/2)+2,0]) { cylinder(h=50, d=2.1, $fn=100, center=true); }
  translate([(int_width/2)-2, -(int_height/2)+2,.5]) { cylinder(h=1.01, d=6.1, $fn=100, center=true); }

  // left hand pinholes
  translate([(-int_width/2)+2, (int_height/2)-2,0]) { cylinder(h=50, d=2.1, $fn=100, center=true); }
  translate([(-int_width/2)+2, (int_height/2)-2,.5]) { cylinder(h=1.01, d=6.1, $fn=100, center=true); }

  translate([-(int_width/2)+2,-(int_height/2)+2,0]) { cylinder(h=50, d=2.1, $fn=100, center=true); }
  translate([-(int_width/2)+2,-(int_height/2)+2,.5]) { cylinder(h=1.01, d=6.1, $fn=100, center=true); }


}

