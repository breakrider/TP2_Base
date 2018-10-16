
update tbl_local set nombre_de_bureau = 16, nombre_prise_ethernet = 16, imprimante = 674 where nom_local="p210";
update tbl_local set nombre_de_bureau = 27, nombre_prise_ethernet = 27, imprimante = 676 where nom_local="p308";
update tbl_local set nombre_de_bureau = 27, nombre_prise_ethernet = 27, imprimante = 677 where nom_local="p309";
update tbl_local set nombre_de_bureau = 27, nombre_prise_ethernet = 27, imprimante = 678 where nom_local="p409";
update tbl_local set nombre_de_bureau = 5, nombre_prise_ethernet = 6, imprimante = 673 where nom_local="p416";
update tbl_local set nombre_de_bureau = 27, nombre_prise_ethernet = 27, imprimante = 679 where nom_local="p418";


insert into tbl_type_usager (pk_id_type_usager,nom_type_usager) values (1, "professeur"),(2,"employe"),(3,"etudiant");
update tbl_usager set type_usager = 1 where pk_id_usager between 1 and 9 ;
update tbl_usager set type_usager = 2 where pk_id_usager between 100 and 999 ;
update tbl_usager set type_usager = 3 where pk_id_usager >= 1000 ;

insert into tbl_type_peripherique (pk_id_type_peripherique, nom_type_peripherique) values (1, "type-ecran"),(2,"imprimante"),(3,"souris"), (4,"clavier");
SET SQL_SAFE_UPDATES=0;
update tbl_peripherique set type_de_peripherique = 1 where nom_peripherique like "%ecran%" ;
SET SQL_SAFE_UPDATES=1;
SET SQL_SAFE_UPDATES=0;
update tbl_peripherique set type_de_peripherique = 2 where nom_peripherique like "%imprimante%" ;
SET SQL_SAFE_UPDATES=1;
SET SQL_SAFE_UPDATES=0;
update tbl_peripherique set type_de_peripherique = 3 where nom_peripherique like "%souris%" ;
SET SQL_SAFE_UPDATES=1;
SET SQL_SAFE_UPDATES=0;
update tbl_peripherique set type_de_peripherique = 4 where nom_peripherique like "%clavier%" ;
SET SQL_SAFE_UPDATES=1;