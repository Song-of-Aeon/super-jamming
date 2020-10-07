///c_standard

//lr movement
if hput != 0 {
    hspd += hput * acc;
    hspd = clamp(hspd, -maxhspd, maxhspd);
}

if(abs(hspd) < 0.2 and !aerial){ //. stopping it from bullshitting like funny
    hspd = 0;
}


var collide = collision_line(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,o_collide,false,true);
if(collide != noone){
    grounded = true;
}
else{
    grounded = false;
}
//.snap to collider.
if(grounded){
    yy = collide.bbox_top-(sprite_height- sprite_get_yoffset(sprite_index));
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
    image_index = round(clamp(vspd, -4, 5))+4;
}

//ud collision
if !place_meeting(xx, yy + 1, o_collide) {
    vspd += grav;
    leniance -= .5;
    hspd = lerp(hspd, 0, frict/2);
    aerial = true;
    grav = .2;
    /*if vspd < .3 && vspd > -.3 {
        sprite_index = neutral;
    }*/
} else {
    leniance = 5;
    acc = .3;
    sprite_index = ground;
    hspd = lerp(hspd, 0, frict);
    aerial = false; 
    yy = floor(yy);
    vspd = 0;
    dashed = false;
}

if place_meeting(xx, yy + floor(vspd), o_collide) {
    while !place_meeting(xx, yy + sign(floor(vspd)), o_collide) {
        yy += sign(floor(vspd));
    }
    vspd = 0;
    
}


   // yy = ceil(yy)
  

//directions and sprites

if (down) {
    dir = 2;
}

if (up) {
    dir = 0;
}

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


if (((!left && !right) || hspd = 0 ) && !aerial) && !keyboard_check(vk_down) {
    sprite_index = neutral;
} else if !aerial {
    image_speed = abs(hspd/16);
    sprite_index = ground;
    if room > 5 && image_index = 3 {
        if !audio_is_playing(se_grass) {
            audio_play_sound(se_grass, 0, false);
        }
    } else {
        if !audio_is_playing(se_stone) {
            audio_play_sound(se_stone, 0, false);
        }
    }
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
        sprite_index = crouch;
        audio_play_sound(se_jump, 0, false);
    }
}

if place_meeting(x, y, o_damage) && !inv {
    hp--;
    if hp < 2 {
        audio_play_sound(se_hurtwo, 0, false);
    } else {
        audio_play_sound(se_hurt, 0, false);
    }
    //audio_play_sound(something);
    if hp = 0 {
        state = c_death;
        sprite_index = death;
        hp = -1;
    } else {

        inv = true;
        alarm[0] = 60;
        image_alpha = .5;
        vspd = -2;
    }
    
} else if inv
        image_speed = .3;


    xx += hspd;
    yy += vspd;

yy = ceil(yy)






if attack && lv >= 1 && ((!aerial && lv < 3) || lv = 3) {
    endtimer = 20;
    state = c_attack;
    sprite_index = attacking;
    image_index = 0;
    c_hitbox_create(id,"s_attack2",1);
    hspd = hspd/3;
    audio_play_sound(se_attack, 0, false);
    if lv >= 2 {
        instance_create(x+(dir-1)*64, y-8, o_afterimage);
    }
}

if dash && lv >= 1 && !dashed {
    audio_play_sound(se_dash, 0, false);
    endtimer = 15;
    state = c_dash;
    vspd = vspd/2;
    dashed = true;
    c_hitbox_create(id,"s_dash",1);
    hspd = -(dir-1)*8;
    if lv >= 2 {
        instance_create(x+(dir-1)*64, y-8, o_afterimage);
    }
}
y = yy;
x = xx;

if(down and !aerial){
    sprite_index = crouch;
    image_index = 0;
    hspd = 0;
}

//image_speed = 1;
