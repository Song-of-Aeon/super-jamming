///c_standard

//lr movement
if hput != 0 {
    hspd += hput * acc;
    hspd = clamp(hspd, -maxhspd, maxhspd);
}

if(abs(hspd) < 0.2 and !aerial){ //. stopping it from bullshitting like funny
    hspd = 0;
}



//lr collision

if place_meeting(xx + hspd, yy, o_solid) {
    var i = 0;
    while !place_meeting(xx + sign(hspd), yy, o_solid) {
        xx += sign(hspd);
        i++;
        if i > sprite_width { break; } 
    }
    hspd = 0;
}

if place_meeting(xx + hspd, yy, o_slope) {
    yplus = 0;
    while (place_meeting(xx + hspd, yy - yplus, o_slope) && yplus <= abs(1 * hspd)) yplus += 1;
    if place_meeting(xx + hspd, yy - yplus, o_slope) {
        while (!place_meeting(xx + sign(hspd), yy, o_slope)) xx += sign(hspd);
        hspd = 0;
    } else {
        yy -= yplus;
    }
}

//ud movement



if vspd < 0 {
    if (jumprel) {
        vspd = vspd / 2;
    }
}

if vspd = 0 {
    if !(shift) {
        grav = .14;
    } else {
        grav = .1;
    }
}

if aerial = true {
    //prite_index = s_air;
}

//ud collision
if !place_meeting(xx, yy + 1, o_collide) {
    vspd += grav;
    leniance -= .5;
    hspd = lerp(hspd, 0, frict/2);
    aerial = true;
    grav = .14;
} else {
    leniance = 5;
    acc = .3;
    //sprite_index = s_ground;
    hspd = lerp(hspd, 0, frict);
    aerial = false; 
    yy = floor(yy);
    vspd = 0;
}

if place_meeting(xx, yy + vspd, o_collide) {
    while !place_meeting(xx, yy + sign(vspd), o_collide) {
        yy += sign(vspd);
    }
    vspd = 0;
    
}


//directions and sprites

if (right) {
    dir = 0;
    if(image_xscale == 1){
        xx++;
    }
    image_xscale = -1;    
}

if (left) {
    dir = 2;
    if(image_xscale == -1){
        xx--;
    }
    image_xscale = 1;
}

if (down) {
    dir = 3;
}

if (up) {
    dir = 1;
}

if (((!left && !right) || hspd = 0 ) && !aerial) && !keyboard_check(vk_down) {
    //sprite_index = s_neutral;
}

if(!aerial){
    image_speed = abs(hspd/13);
    if hspd == 0 {
      image_index = 0;
    }
    
}

//the actual going

if leniance > 0 {
    if (jump) {
        if !(shift) {
            vspd = jspd;
            leniance = 0;
        } else {
            vspd = .5 * jspd;
            leniance = 0;
        }
    }
}

if !(shift) {
    xx += hspd;
} else {
    xx += hspd / 1.5;
}

if !(shift) {
    yy += vspd;
} else {
    yy += vspd / 1.1;
}
//xx = floor(xx)
yy = floor(yy)
x = floor(xx);
y = floor(yy);
