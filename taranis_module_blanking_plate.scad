width=48.2;
height=64.1;

int_width=44.2;
int_height=60.1;
int_depth = 10;

difference() {
  union() {
    //wings
    cube([width+6.5,18.12,2], true);
    
    //plate
    cube([width,height,2], true);

    difference() {
      translate([0,0,5]) {
        cube([int_width, int_height, int_depth], true);
      }
      translate([0,0,4.1]) {
        cube([int_width-4, int_height-4, int_depth+2], true);
      }
    } // give me some height to press fit into with...

    translate([-(int_width/2), 0,4]) { rotate([90,0,0]) { cylinder(d=2, h=18, $fn=20, center=true); } } // a nubbin to latch
    translate([ (int_width/2), 0,4]) { rotate([90,0,0]) { cylinder(d=2, h=18, $fn=20, center=true); } } // a nubbin to latch
  }
  
  translate([0,-(height/2)+15,0]) { cylinder(d=10, h=50, $fn=20, center=true); } // bind button

  translate([-(width/2),-(height/2),0]) { rotate([0,0,45]) { cube([4,4,4], true); } } // knock off the corner
  translate([-(width/2), (height/2),0]) { rotate([0,0,45]) { cube([4,4,4], true); } } // knock off the corner
  translate([ (width/2),-(height/2),0]) { rotate([0,0,45]) { cube([4,4,4], true); } } // knock off the corner
  translate([ (width/2), (height/2),0]) { rotate([0,0,45]) { cube([4,4,4], true); } } // knock off the corner
}

//translate([0,0,3]) { cube([45.2,1,3], center=true); }

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