image_speed = 0.1
sprite_index = s_drinking;
if(image_index = 0){
    audio_play_sound(se_drinking, 0, false);
}
if(round(image_index) == sprite_get_number(sprite_index)-1){
    state = c_standard;
    IMMORTALIZE.hp = 3+lv;
}

