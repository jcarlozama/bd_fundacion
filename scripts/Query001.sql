
select * from donante
select * from donacion
select * from campania
select * from metodo_pago

select d1.fec_donacion, d1.monto, d2.nombre AS 'donante', c.nombre as 'campaña', mp.descripcion as 'pago'
from donacion d1
join donante d2
on d2.id_donante = d1.id_donante
join campania c
on c.id_camp = d1.id_camp
join metodo_pago mp
on mp.id_mpago = d1.id_mpago