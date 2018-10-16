
#show create table tbl_peripherique;

select concat(tbl_usager.nom_usager, " ", tbl_usager.prenom_usager) as nom_prenom,
tbl_local.nom_local,
tbl_type_usager.nom_type_usager
from tbl_usager
inner join tbl_local
on tbl_usager.fk_tbl_local_id_local = tbl_local.pk_id_local
inner join tbl_type_usager
on tbl_usager.type_usager = tbl_type_usager.pk_id_type_usager;
