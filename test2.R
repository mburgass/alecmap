base_test<-tm_shape(poly_country, is.master=T)+ tm_borders(col="black", lwd = 1)+
  tm_fill(col="lightgrey") + tm_text("ADMIN", size="AREA", root=2, auto.placement = TRUE)
#base<- base + tm_shape(poly_gulf)
#base<- base + tm_shape(poly_regions) + ### is.master so this layer will drive extents, etc
#tm_fill(col = '#e17133') +
#tm_borders(col = 'grey30', lwd = 1)+
#tm_text('name', size = 0.5, 
#legend.size.show = FALSE)
base_test<- base_test + tm_shape(poly_rivers)+tm_lines(col="dodgerblue3") +
  tm_add_legend(type="line", col="dodgerblue3")
#base<- base + tm_shape(poly_rivers2) +tm_lines(col="dodgerblue3") + tm_text('name', size=0.75, col = "dodgerblue3", auto.placement = TRUE)
base_test<- base_test + tm_shape(poly_pop2) + tm_symbols(size=0.1, col='black') + tm_text('NAME', size=0.7, auto.placement = TRUE)
#base<- base + tm_shape(poly_gulf)
print(base_test)
