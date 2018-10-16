
select concat(tbl_usager.nom_usager, " ", tbl_usager.prenom_usager) as nom_prenom,
tbl_local.nom_local,
tbl_poste.desc_poste
from tbl_usager
inner join tbl_local
on tbl_usager.fk_tbl_local_id_local = tbl_local.pk_id_local
inner join tbl_poste
on tbl_usager.pk_id_usager= tbl_poste.pk_id_poste;