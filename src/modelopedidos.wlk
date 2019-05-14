import dependencias.* 
import rodados.*
class Pedido {
	var property distancia
	var property tiempoMaximo
	var property pasajeros
	var property coloresIncompatibles = #{}

method velocidadRequerida() {
	return distancia/tiempoMaximo
}

method puedeSatisfacer(rodado){
	return rodado.velocidad()+10 >= self.velocidadRequerida() 
	&& rodado.capacidad() >= pasajeros && not coloresIncompatibles.contains(rodado.color())
}

method acelerar(){
	tiempoMaximo -=1
}

method relajar(){
	tiempoMaximo += 1
}
}