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
                txt_edge();
            }
        }
        
        break;
    case 2:
        if !instance_exists(o_boss) {
            instance_create(0, 160, o_boss);
        }
        IMMORTALIZE.state = c_lock;
        o_view.target = o_boss;
        count++;
        if count >= 120 {
            o_view.target = 0;
            count = 0;
            goingdoing++;
        }
    case 3:
        if !instance_exists(o_textbox) && o_view.target = 0 {
           with instance_create(view_xview+320, view_yview+280, o_textbox) {
                txt_drink3();
            }
        }
        
        break;
    case 4:
        instance_destroy();
        IMMORTALIZE.state = c_drinking;
        IMMORTALIZE.lv++;
        o_boss.going = true;
        audio_play_sound(se_drinking, 0, false);
        hp = 3;
        count = 0;
        break;
}

