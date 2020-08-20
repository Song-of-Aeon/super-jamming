//.ZOOMING
if(keyboard_check_pressed(vk_add)){
zoom *= 1.5;
}
if(keyboard_check_pressed(vk_subtract)){
zoom /= 1.5;
}
if(keyboard_check_pressed(vk_multiply)){
zoom = 1;
}
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
