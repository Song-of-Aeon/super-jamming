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
        grav = .2;
    } else {
        grav = .15;
    }
}

if aerial = true {
    sprite_index = air;
}

//ud collision
if !place_meeting(xx, yy + 1, o_collide) {
    vspd += grav;
    leniance -= .5;
    hspd = lerp(hspd, 0, frict/2);
    aerial = true;
    grav = .2;
} else {
    leniance = 5;
    acc = .3;
    sprite_index = ground;
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
    dir = 2;
}

if (up) {
    dir = 0;
}

if (((!left && !right) || hspd = 0 ) && !aerial) && !keyboard_check(vk_down) {
    sprite_index = neutral;
} else if !aerial {
    image_speed = abs(hspd/13);
    sprite_index = ground;
    if hspd == 0 {
      image_index = 0;
    }
    
} else {
    sprite_index = air;
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

if attack && lv >= 1 && ((!aerial && lv < 3) || lv = 3) {
    endtimer = 20;
    state = c_attack;
    sprite_index = attacking;
    image_index = 0;
    hspd = hspd/4;
    instance_create(x+(dir-1)*64, y, o_afterimage);
}

if dash && lv >= 1 {
    endtimer = 20;
    state = c_dash;
    vspd = vspd/2;
    hspd = -(dir-1)*6;
    instance_create(x+(dir-1)*64, y, o_afterimage);
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

if(keyboard_check_pressed(vk_f1)){
    c_hitbox_create(id,"test");
}

if place_meeting(x, y, o_damage) && !inv {
    hp--;
    inv = true;
    alarm[0] = 60;
    image_alpha = .5;
    vspd = -2;
    //audio_play_sound(something);
}

//image_speed = 1;
