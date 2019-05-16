import rodados.*
class Dependencia {
	var flota = []
	var property empleados = 2
	var pedidos = []
	
method agregarAFlota(rodado) {flota.add(rodado)}
method quitarDeFlota(rodado) {flota.remove(rodado)}
method pesoTotalFlota(){return flota.sum({rodado => rodado.peso()})}
method estaBienEquipada() {return flota.size() >=3 && flota.all({rodado => rodado.velocidad() >= 100})}
method capacidadTotalEnColor(color){return flota.filter{rodado => rodado.color()==color}.sum{rodado => rodado.capacidad()}}
method colorDelRodadoMasRapido(){return flota.max{rodado => rodado.velocidad()}.color()}
method capacidadFaltante(){return empleados - flota.sum({rodado => rodado.capacidad()})}
method esGrande() {return empleados>=40 && flota.size()>5}

//pedidos
method totalPasajeros() {return pedidos.sum({pedido => pedido.pasajeros()})}
method agregarPedido(pedido) {pedidos.add(pedido)}
method quitarPedido(pedido) {pedidos.remove(pedido)}
method pedidosNoSatisfechos() {return not pedidos.filter({pedido => self.lopuedeSatisfacer(pedido)})}
method lopuedeSatisfacer(pedido) {return flota.any({rodado => pedido.puedeSatisfacer(rodado)})}
method esColorRechazado(color){return pedido.all({pedido => pedido.coloresIncompatibles().contains(color)})}
method relajarTodosLosPedidos(){pedidos.forEach({pedido =>pedido.relajar()})
	}
}

