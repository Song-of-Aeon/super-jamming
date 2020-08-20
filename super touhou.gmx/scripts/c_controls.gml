//.ZOOMING
/*
if(keyboard_check_pressed(vk_add)){
zoom *= 1.5;
}
if(keyboard_check_pressed(vk_subtract)){
zoom /= 1.5;
}
if(keyboard_check_pressed(vk_multiply)){
zoom = 1;
}*/ //.DONT ZOOM, ZOOMERS SUCK BALLS LOL
//.CHANGING SPRITES
if(keyboard_check_pressed(ord("E"))){
    currentSprite++;
}
if(keyboard_check_pressed(ord("Q"))){
    currentSprite--;
}

//.TIMELINE CONTROLS
if(keyboard_check(vk_right)){
    progress+=0.01;
}
if(keyboard_check(vk_left)){
    progress-=0.01;
}
if(keyboard_check(vk_up)){
image_speed += 0.01; //. used for looking at the animation when its unpaused
}
if(keyboard_check(vk_down)){
image_speed -= 0.01; //. used for looking at the animation when its unpaused
}
progress = clamp(progress, 0 ,1);
image_speed = max(image_speed,0);
if(keyboard_check_pressed(vk_space)){
    playing = !playing;
}

//.MAKING HITBOXES
if(mouse_check_button_pressed(mb_left)){
    if(collision_point(mouse_x,mouse_y,HITBOXMAKER,false,false)){
    c_hitbox_save();
     } //.if hitting da save button
    instance_create(mouse_x,mouse_y,o_fakeHit_box);
}
//.right click on a hitbox to destroy everything under the hitbox, ctrl z within 5 seconds to reverse everything destroyed in the last 5 seconds
//.press A to set the minimum active frame on any hitbox you are mousing over (no undo)
//.press S to set the maximum active frame on any hitbox you are mousing over (no undo)
