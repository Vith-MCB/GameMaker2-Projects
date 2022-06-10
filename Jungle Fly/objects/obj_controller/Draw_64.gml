//mostrando os pontos
if(room != rm_perdeu){
	var pontuacao_total = string(round(pontos));
	draw_set_font(fnt_8bits);
	draw_text(12, 12, "Pontos: " + pontuacao_total);
}