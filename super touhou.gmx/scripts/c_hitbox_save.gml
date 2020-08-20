hitboxlist = ds_map_create();
for(i = 0; i < instance_number(o_fakeHit_box); i++){
    console_log("pog");
    var anotherlist = ds_list_create()
    var fakey = instance_find(o_fakeHit_box,i);
    ds_list_add(anotherlist, fakey.x-(view_wview/2) ,
    fakey.y-(view_hview/2) ,
    fakey.width ,
    fakey.height ,
    fakey.activemin ,
    fakey.activemax );
    //ds_map_add(hitboxlist,i,anotherlist);
    //ds_list_mark_as_list(hitboxlist,i);
    ds_map_add_list(hitboxlist,i,anotherlist);
    //ds_list_destroy(anotherlist)
}
var str = json_encode(hitboxlist);
console_log(str);
//ds_list_destroy(hitboxlist);
var file = file_text_open_write(working_directory+sprite_get_name(HITBOXMAKER.currentSprite)+".json");
file_text_write_string(file,str);
file_text_close(file);
