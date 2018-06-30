#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Navire
#------------------------------------------------------------

CREATE TABLE Navire(
        ID  Int  Auto_increment  NOT NULL ,
        Nom Varchar (255)
	,CONSTRAINT Navire_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Heros
#------------------------------------------------------------

CREATE TABLE Heros(
        ID     Int  Auto_increment  NOT NULL ,
        Nom    Varchar (255) NOT NULL ,
        Prenom Varchar (255)
	,CONSTRAINT Heros_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Divinite
#------------------------------------------------------------

CREATE TABLE Divinite(
        ID  Int  Auto_increment  NOT NULL ,
        Nom Varchar (255) NOT NULL
	,CONSTRAINT Divinite_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Expedition
#------------------------------------------------------------

CREATE TABLE Expedition(
        ID          Int  Auto_increment  NOT NULL ,
        Numero      Int ,
        ID_Divinite Int NOT NULL ,
        ID_Navire   Int NOT NULL ,
        ID_Heros    Int NOT NULL
	,CONSTRAINT Expedition_PK PRIMARY KEY (ID)

	,CONSTRAINT Expedition_Divinite_FK FOREIGN KEY (ID_Divinite) REFERENCES Divinite(ID)
	,CONSTRAINT Expedition_Navire0_FK FOREIGN KEY (ID_Navire) REFERENCES Navire(ID)
	,CONSTRAINT Expedition_Heros1_FK FOREIGN KEY (ID_Heros) REFERENCES Heros(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ville
#------------------------------------------------------------

CREATE TABLE Ville(
        ID  Int  Auto_increment  NOT NULL ,
        Nom Varchar (255) NOT NULL
	,CONSTRAINT Ville_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Etape
#------------------------------------------------------------

CREATE TABLE Etape(
        ID            Int  Auto_increment  NOT NULL ,
        Indice        Int NOT NULL ,
        ID_Expedition Int NOT NULL ,
        ID_Ville      Int NOT NULL
	,CONSTRAINT Etape_PK PRIMARY KEY (ID)

	,CONSTRAINT Etape_Expedition_FK FOREIGN KEY (ID_Expedition) REFERENCES Expedition(ID)
	,CONSTRAINT Etape_Ville0_FK FOREIGN KEY (ID_Ville) REFERENCES Ville(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Participe
#------------------------------------------------------------

CREATE TABLE Participe(
        ID       Int NOT NULL ,
        ID_Heros Int NOT NULL
	,CONSTRAINT Participe_PK PRIMARY KEY (ID,ID_Heros)

	,CONSTRAINT Participe_Expedition_FK FOREIGN KEY (ID) REFERENCES Expedition(ID)
	,CONSTRAINT Participe_Heros0_FK FOREIGN KEY (ID_Heros) REFERENCES Heros(ID)
)ENGINE=InnoDB;

