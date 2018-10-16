create index tbl_usager_nom_usager_prenom_usager on tbl_usager(nom_usager,prenom_usager);

create index tbl_local_nom_local on tbl_local(nom_local);

create index tbl_logiciel_nom_logiciel on tbl_logiciel(nom_logiciel);

create index tbl_editeur_nom_editeur on tbl_editeur(nom_editeur);

create index tbl_peripherique_nom_peripherique on tbl_peripherique(nom_peripherique);

create index tbl_fabricant_nom_fabricant on tbl_fabricant(nom_fabricant);

create fulltext index tbl_poste_desc_poste_desc_processeur on tbl_poste(desc_poste, desc_processeur);

alter table tbl_local
ADD CONSTRAINT un_nom_local UNIQUE (nom_local),
modify nom_local varchar(45) not null ;

alter table tbl_logiciel
ADD CONSTRAINT un_nom_logiciel UNIQUE (nom_logiciel);
##deja a not null

alter table tbl_editeur
ADD CONSTRAINT un_nom_editeur UNIQUE (nom_editeur);
##deja a not null

alter table tbl_fabricant
ADD CONSTRAINT un_nom_fabricant UNIQUE (nom_fabricant),
modify nom_fabricant varchar(45) not null ;