switch goingdoing {
    case 0:
        IMMORTALIZE.state = c_lock;
        o_view.target = o_camerahook;
        count++;
        if count >= 120 {
            o_view.target = 0;
            count = 0;
            goingdoing++;
        }
    case 1:
        if !instance_exists(o_textbox) && o_view.target = 0 {
           with instance_create(view_xview+320, view_yview+280, o_textbox) {
                txt_drink2();
            }
        }
        
        break;
    case 2:
        instance_destroy();
        IMMORTALIZE.state = c_standard; //c_drinking
        IMMORTALIZE.lv++;
        audio_play_sound(se_drinking, 0, false);
        hp = 6;
        count = 0;
        break;
}

