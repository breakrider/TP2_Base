#1
select concat(tbl_usager.nom_usager, " ", tbl_usager.prenom_usager) as nom_prenom,
tbl_local.nom_local,
tbl_poste.desc_poste
from tbl_usager
left join tbl_poste
on tbl_usager.pk_id_usager= tbl_poste.pk_id_poste
inner join tbl_local
on tbl_usager.fk_tbl_local_id_local = tbl_local.pk_id_local;

#2
select
(select count(*) from tbl_poste_has_tbl_usager)  as nombre_de_poste_assigner ,
((select count(*) from tbl_poste)-(select count(*) from tbl_poste_has_tbl_usager))as nombre_de_poste_non_assigner;

#4
select (nom_local),
count(*) from tbl_local
inner join tbl_usager on tbl_local.pk_id_local = tbl_usager.fk_tbl_local_id_local
#inner join tbl_poste_has_tbl_usager on tbl_usager.pk_id_usager = tbl_usager.pk_id_usager
group by nom_local;

#5
select 
tbl_local.nom_local,
count(*) as nombre_usager_par_local
from tbl_usager
left join tbl_poste
on tbl_usager.pk_id_usager= tbl_poste.pk_id_poste
inner join tbl_local
on tbl_usager.fk_tbl_local_id_local = tbl_local.pk_id_local
group by tbl_local.nom_local;

