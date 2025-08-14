
select * from donante
select * from donacion
select * from canal
select * from campania
select * from evento
select * from metodo_pago
select * from participacion

select d1.fec_donacion, d1.monto, d2.nombre, c.nombre, mp.nombre, cn.nombre
from donacion d1
join donante d2
on d2.id_donante = d1.id_donante
join campania c
on c.id_camp = d1.id_camp
join metodo_pago mp
on mp.id_mpago = d1.id_mpago
join canal cn
on cn.id_canal = d1.id_canal