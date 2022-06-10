//Pegando o x da câmera
var cam_x = -(camera_get_view_x(view_camera[0]));

//Definindo x para paralax (velocidade por layer)
layer_x("Backgrounds_4", cam_x * 0.1);
layer_x("Backgrounds_3", cam_x * 0.2);
layer_x("Backgrounds_2", cam_x * 0.3);
layer_x("Backgrounds_1", cam_x * 0.5);
