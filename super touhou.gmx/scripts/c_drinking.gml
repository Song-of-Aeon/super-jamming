///c_standard

//lr movement

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





if aerial = true {
    prite_index = air;
}

//ud collision
if !place_meeting(xx, yy + 1, o_collide) {
    vspd += grav;
    leniance -= .5;
sprite_index = s_death2
    //image_speed = 0.25;
    if(round(image_index) == sprite_get_number(sprite_index)-1 and sign(image_speed) != -1){
        audio_play_sound(se_drinking, 0, false);
        hp = 3;
        image_speed = -0.25;
        //state = c_standard;
    }

//image_speed = 1;
