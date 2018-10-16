
#show create table tbl_peripherique;


#select count(*) from tbl_poste_has_tbl_logiciel where tbl_poste_has_tbl_logiciel.fk_tbl_logiciel_id_logiciel= 1 ;
#select count(*) from tbl_poste_has_tbl_logiciel where tbl_poste_has_tbl_logiciel.fk_tbl_logiciel_id_logiciel= 22 ;

SELECT pk_id_poste, COUNT(*) AS NombreDePostes
FROM tbl_usager as u
inner JOIN tbl_poste_has_tbl_usager AS tphu
    ON u.pk_id_usager = tphu.fk_tbl_poste_id_poste
inner JOIN tbl_poste as p ON pk_id_poste = tphu.fk_tbl_usager_id_usager
GROUP BY fk_tbl_local_id_local
ORDER BY NombreDePostes DESC;

select concat(tbl_usager.nom_usager, " ", tbl_usager.prenom_usager) as nom_prenom,
tbl_local.nom_local,
tbl_poste.desc_poste
from tbl_usager
left join tbl_poste
on tbl_usager.pk_id_usager= tbl_poste.pk_id_poste
inner join tbl_local
on tbl_usager.fk_tbl_local_id_local = tbl_local.pk_id_local;



select (nom_local),
count(*) from tbl_local
inner join tbl_usager on tbl_local.pk_id_local = tbl_usager.fk_tbl_local_id_local
inner join tbl_poste_has_tbl_usager on tbl_usager.pk_id_usager = tbl_usager.pk_id_usager
group by nom_local;