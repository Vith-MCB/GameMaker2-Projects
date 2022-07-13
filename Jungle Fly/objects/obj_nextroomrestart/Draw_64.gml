var levelMaximo = string(global.maiorLevel);
var maiorPoint = string(round(global.maiorPontuacao));
draw_set_font(fnt_8bits);
draw_text(530, 278, "TOP Level: " + levelMaximo);
draw_text(530, 300, "TOP Score: " + maiorPoint);
