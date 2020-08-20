///c_standard

//lr movement



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
        grav = .2;
    } else {
        grav = .15;
    }
}

if aerial = true {
    //prite_index = s_air;
}

//ud collision
if !place_meeting(xx, yy + 1, o_collide) {
    vspd += grav;
    leniance -= .5;
    if lv = 1 {
        hspd = lerp(hspd, 0, frict/3);
    } else {
        vspd = 0;
    }
    aerial = true;
    grav = .2;
} else {
    leniance = 5;
    acc = .3;
    //sprite_index = s_ground;
    if lv = 1 
        hspd = lerp(hspd, 0, frict/3);
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




//the actual going

if leniance > 0 {
    if jump {
        dashend = "jump";
    }
}

if attack /*and also probably cooldown or something*/ {
    //dashend = ;
}

if dash && lv >= 2 {
    dashtimer = 20;
    dashend = c_dash;
}


    xx += hspd;

    yy += vspd;
//xx = floor(xx)
yy = floor(yy)
x = floor(xx);
y = floor(yy);


image_speed = abs(hspd/13);
sprite_index = s_dash;
dashtimer--;
if dashtimer <= 0 {
    if dashend = "jump" && leniance > 0 {
        if !(shift) {
            vspd = jspd;
            leniance = 0;
        } else {
            vspd = .5 * jspd;
            leniance = 0;
        }
        state = c_standard;
    } else {
        state = dashend;
    }
    dashend = c_standard;
}
