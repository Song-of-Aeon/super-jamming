///ds_grid_swap_columns(id,col1,col2);
//from https://www.gmlscripts.com/script/ds_grid_swap_columns

if argument1 != argument2 {
    var i, temp;
    i = 0;
    repeat (ds_grid_height(argument0)) {
        temp = ds_grid_get(argument0, argument1, i);
        ds_grid_set(argument0, argument1, i, ds_grid_get(argument0, argument2, i));
        ds_grid_set(argument0, argument2, i, temp);
        i += 1;
    }
    return 0;
}
