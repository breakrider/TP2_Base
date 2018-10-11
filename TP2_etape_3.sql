CREATE TABLE IF NOT EXISTS `Tp2`.`tbl_type_usager` (
  `pk_id_type_usager` INT(11) NOT NULL,
  `nom_type_usager` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_id_type_usager`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

ALTER TABLE tbl_usager 
ADD type_usager int after telephone_usager;
SET SQL_SAFE_UPDATES=0;
ALTER TABLE tbl_usager
ADD CONSTRAINT fk_tbl_type_usager_tbl_usager1 FOREIGN KEY(fk_tbl_type_usager_tbl_usager) 
   REFERENCES tbl_type_usager(pk_id_type_usager);
   sET SQL_SAFE_UPDATES=1;
   
CREATE TABLE IF NOT EXISTS `Tp2`.`tbl_type_peripherique` (
  `pk_id_type_peripherique` INT(11) NOT NULL,
  `nom_type_periphqerique` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_id_type_peripherique`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
   
   

ALTER TABLE tbl_peripherique
add type_de_peripherique int after nom_peripherique;
ALTER TABLE tbl_peripherique
ADD CONSTRAINT fk_tbl_type_peripherique_tbl_peripherique1 FOREIGN KEY(type_de_peripherique) 
   REFERENCES tbl_type_peripherique(pk_id_type_peripherique);
 
 ALTER TABLE tbl_local
ADD nombre_de_bureau int after nom_local,
Add nombre_prise_ethernet int after nombre_de_bureau,
add imprimante int after nombre_prise_ethernet,
ADD CONSTRAINT fk_tbl_peripherique_tbl_local1 FOREIGN KEY(imprimante) 
   REFERENCES tbl_peripherique(type_de_peripherique); 
   
   
