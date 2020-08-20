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

if place_meeting(x + hspd, y, o_solid) {
    var i = 0;
    while !place_meeting(x + sign(hspd), y, o_solid) {
        x += sign(hspd);
        i++;
        if i > sprite_width { break; } 
    }
    hspd = 0;
}

if place_meeting(x + hspd, y, o_slope) {
    yplus = 0;
    while (place_meeting(x + hspd, y - yplus, o_slope) && yplus <= abs(1 * hspd)) yplus += 1;
    if place_meeting(x + hspd, y - yplus, o_slope) {
        while (!place_meeting(x + sign(hspd), y, o_slope)) x += sign(hspd);
        hspd = 0;
    } else {
        y -= yplus;
    }
}

//ud movement



if vspd < 0 {
    if (r_s) {
        vspd = vspd / 2;
    }
}

if vspd = 0 {
    if !(shift) {
        if(enabled){
            grav = .28;
        } else {
            grav = .14;
        }
    } else {
        if(enabled){
            grav = .2;
        } else {
            grav = .1;
        }
    }
}

if aerial = true {
    sprite_index = s_air;
}

//ud collision
if !place_meeting(x, y + 1, o_collide) {
    vspd += grav;
    leniance -= .5;
    hspd = lerp(hspd, 0, frict/2);
    aerial = true;
    grav = .14;
} else {
    leniance = 5;
    acc = .3;
    sprite_index = s_ground;
    hspd = lerp(hspd, 0, frict);
    aerial = false; 
    y = floor(y);
    vspd = 0;
}

if place_meeting(x, y + vspd, o_collide) {
    while !place_meeting(x, y + sign(vspd), o_collide) {
        y += sign(vspd);
    }
    vspd = 0;
    
}


//directions and sprites

if (right) {
    dir = 0;
    if(image_xscale == 1){
        x++;
    }
    image_xscale = -1;    
}

if (left) {
    dir = 2;
    if(image_xscale == -1){
        x--;
    }
    image_xscale = 1;
}

if (down) {
    dir = 3;
}

if (up) {
    dir = 1;
}

if (((!left and !right)or hspd == 0 ) and !aerial) and !keyboard_check(vk_down) {
    sprite_index = s_neutral;
}

if(!aerial){
    image_speed = abs(hspd/13);
    if hspd == 0 {
      image_index = 0;
    }
    
}

//the actual going

if leniance > 0 {
    if (k_s) {
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
    x += hspd;
} else {
    x += hspd / 1.5;
}

if !(shift) {
    y += vspd;
} else {
    y += vspd / 1.1;
}

