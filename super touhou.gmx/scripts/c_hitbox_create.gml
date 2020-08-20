///c_hitbox_create(object,hitboxName)
/// object is object to attach to, this is where it gets image_speed, x and y, it sticks to the object;
var hitboxName = argument[1];
var obj = argument[0];
if(c_hitbox_exists(hitboxName)){
    var file = file_text_open_read(working_directory+hitboxName+".json");
    map = json_decode(file_text_readln(file));
    for(i = 0; i < ds_map_size(map);i++){
        var list = map[? string(i)];
        var obj2 = instance_create(0,0,o_hitbox)
        with(obj2){
            xx = list[|0];
            yy = list[|1];
            width = list[|2];
            height = list[|3];
            activemin = list[|4];
            activemax = list[|5];
        }
        obj2.parent = obj;
    }
    ds_map_destroy(map);
}
