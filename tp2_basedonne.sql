/*
	Maxime Dion, TP2                               
	3 octobre 2018 
*/

#CREATE DATABASE Tp2;
USE Tp2;

/*
	Étape 1 : création des tables 
*/

CREATE TABLE tbl_fabricant(
	pk_id_fabricant INT PRIMARY KEY,
    nom_fabricant VARCHAR(45)
    )
    engine=InnoDB;

CREATE TABLE tbl_poste(
	pk_id_poste int primary key,
    desc_poste varchar(45),
    desc_processeur varchar(45),
    nb_ram_mo varchar(45),
    tail_disque_giga INT,
    index fk_tbl_poste_tbl_fabricant1_idx(tbl_fabricant asc )
    )
    engine = InnoDB;
    
CREATE TABLE tbl_peripherique(
	pk_id_peripherique int primary key,
    nom_peripherique varchar(45) NOT NULL,
    index fk_tbl_peripherique_tbl_poste_idx(tbl_poste asc),
    index fk_tbl_peripherique_tbl_fabricant_idx(tbl_fabricant asc )
    )
    engine = InnoDB;
