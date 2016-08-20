int_width=43.9;
int_height=59.5;
int_depth = 19;

mnt1_x=-(int_width/2)+(8.5);
mnt1_y=(int_height/2)-(20.1);

mnt2_x=(int_width/2)-(4.4);
mnt2_y=-(int_height/2)+(7.7);

mnt3_x=(int_width/2)-(14.1);
mnt3_y=(int_height/2)-(6.5);

rotate([180,0,0]) {
difference() {
  union() {
    difference() { // the box
      translate([0,0,(int_depth/2)+1]) { cube([int_width, int_height, int_depth], true); }
      translate([0,0,(int_depth/2)-2])   { cube([int_width-2, int_height-3, int_depth+.1], true); }
    }

    translate([-(int_width/2), 0,4]) { rotate([90,0,0]) { cylinder(d=2, h=18, $fn=20, center=true); } } // a nubbin to latch
    translate([ (int_width/2), 0,4]) { rotate([90,0,0]) { cylinder(d=2, h=18, $fn=20, center=true); } } // a nubbin to latch
  }
  translate([17,20.75,int_depth]) { cube([8, 15, 8], true); } // connector cutout

  // right hand pinholes (box top mounting screws)
  translate([(int_width/2)-2, (int_height/2)-2,3]) { cylinder(h=5, d=1.8, $fn=10, center=true); }
  translate([(int_width/2)-2, -(int_height/2)+2,3]) { cylinder(h=5, d=1.8, $fn=10, center=true); }

  // left hand pinholes (box top mounting screws)
  translate([(-int_width/2)+2, (int_height/2)-2,3]) { cylinder(h=5, d=1.8, $fn=10, center=true); }
  translate([-(int_width/2)+2,-(int_height/2)+2,3]) { cylinder(h=5, d=1.8, $fn=10, center=true); }

  translate([mnt1_x, mnt1_y, int_depth]) { cylinder(d=2.1, h=10, $fn=100, center=true); } // board mount drill out
  translate([mnt1_x, mnt1_y, int_depth]) { cylinder(d=5, h=3, $fn=100, center=true); } // board mount screwhead

  translate([mnt2_x, mnt2_y, int_depth]) { cylinder(d=2.1, h=10, $fn=100, center=true); } // board mount drill out
  translate([mnt2_x, mnt2_y, int_depth]) { cylinder(d=5, h=3, $fn=100, center=true); } // board mount screw hole

  translate([mnt3_x, mnt3_y, int_depth]) { cylinder(d=2.1, h=10, $fn=100, center=true); } // board mount drill out
  translate([mnt3_x, mnt3_y, int_depth]) { cylinder(d=5, h=3, $fn=100, center=true); } // board mount screw hole

}


// was 9, 19.6 - too close to pin cutout
translate([mnt1_x, mnt1_y, (int_depth-2.5)]) { // left board mount
  difference() {
    cylinder(d1=5, d2=6, h=2 , $fn=8, center=true); 
    cylinder(d=2.1, h=5, $fn=100, center=true); 
  }
}

// was 4.9,7.7, too far left
translate([mnt2_x, mnt2_y, (int_depth-2.5)]) { // top right board mount
  difference() {
    cylinder(d=5, d2=6, h=2, $fn=8, center=true); 
    cylinder(d=2.1, h=20, $fn=100, center=true); 
  }
}

translate([mnt3_x, mnt3_y, (int_depth-2.5)]) { // lower right board mount
  difference() {
    cylinder(d=5, d2=6, h=2, $fn=8, center=true); 
    cylinder(d=2.1, h=5, $fn=100, center=true); 
  }
}


translate([(int_width/2)-2,(int_height/2)-2,3]) { // right hand pinhole (lower)
  difference() {
    cylinder(h=4, d=4, $fn=10, center=true); 
    cylinder(h=5, d=1.8, $fn=10, center=true); 
  }
}

translate([(int_width/2)-2,-(int_height/2)+2,3]) { // right hand pinhole (upper)
  difference() {
    cylinder(h=4, d=4, $fn=10, center=true); 
    cylinder(h=5, d=1.8, $fn=10, center=true); 
  }
}

translate([-(int_width/2)+2,-(int_height/2)+2,3]) { // left hand pinhole (upper)
  difference() {
    cylinder(h=4, d=4, $fn=10, center=true); 
    cylinder(h=5, d=1.8, $fn=10, center=true); 
  }
}

translate([-(int_width/2)+2, (int_height/2)-2,3]) { // left hand pinhole (lower)
  difference() {
    cylinder(h=4, d=4, $fn=10, center=true); 
    cylinder(h=5, d=1.8, $fn=10, center=true); 
  }
}
}
//translate([0,0,15]) { color("Red") { cube([41,55,2], true); } }


/*
module friction() {
  difference() {
    union() {
      translate([0,0,(int_depth/2)]) { rotate([0,45,0]) { cube([sqrt(2),2,sqrt(2)], true); } } 
      translate([0,0,.5]) { cube([2,2,int_depth-1], true); } 
    }
    translate([2,0,1]) { cube([4,4,int_depth+2], true); }
  }
}

translate([-(int_width/2),  20, (int_depth/2)-1]) { rotate([0,0,0]) { friction(); } }
translate([-(int_width/2), -20, (int_depth/2)-1]) { rotate([0,0,0]) { friction(); } }

translate([ (int_width/2),  20, (int_depth/2)-1]) { rotate([0,0,180]) { friction(); } }
translate([ (int_width/2), -20, (int_depth/2)-1]) { rotate([0,0,180]) { friction(); } }

translate([0,   (int_height/2), (int_depth/2)-1]) { rotate([0,0,-90]) { friction(); } }
translate([0,  -(int_height/2), (int_depth/2)-1]) { rotate([0,0,90]) { friction(); } }
*/