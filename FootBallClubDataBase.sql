CREATE DATABASE footballclub ;
SHOW DATABASES ;
USE footballclub ;
CREATE TABLE homestadium(stname VARCHAR(30),
						 location VARCHAR(30),
						 capacity INTEGER,
						 ticketprice INTEGER,
						 PRIMARY KEY (stname));
                         
CREATE TABLE club(fcid INTEGER,
				  fcname VARCHAR(30),
                  nickname VARCHAR(30),
                  yearestablished INTEGER,
                  cityrepresented VARCHAR(30),
                  stname VARCHAR(30) NOT NULL,
                  PRIMARY KEY (fcid),
                  FOREIGN KEY (stname) REFERENCES homestadium(stname) ON DELETE CASCADE);
                  
CREATE TABLE trophy(fcid INTEGER NOT NULL,
year INTEGER PRIMARY KEY,
FOREIGN KEY (fcid) REFERENCES club(fcid) ON DELETE CASCADE);

CREATE TABLE player(fcid INTEGER NOT NULL,
pid INTEGER,
pname VARCHAR(30),
pdob DATE,
pphonenumber INTEGER,
pnationality VARCHAR(30),
psalary INTEGER,
pshirtnumber INTEGER,
pposition VARCHAR(30),
ptype VARCHAR(30),
PRIMARY KEY(pid),
FOREIGN KEY (fcid) REFERENCES club(fcid) ON DELETE CASCADE);

CREATE TABLE captain(pid INTEGER,
fcid INTEGER PRIMARY KEY,
FOREIGN KEY (pid) REFERENCES player(pid) ON DELETE CASCADE,
FOREIGN KEY (fcid) REFERENCES club(fcid) ON DELETE CASCADE);

CREATE TABLE doctor(fcid INTEGER NOT NULL,
did INTEGER,
dname VARCHAR(30),
ddob DATE,
dphonenumber INTEGER,
dnationality VARCHAR(30),
dsalary INTEGER,
dspecialisity VARCHAR(30),
PRIMARY KEY(did), 
FOREIGN KEY (fcid) REFERENCES club(fcid) ON DELETE CASCADE);

CREATE TABLE coach(fcid INTEGER NOT NULL,
cid INTEGER,
cname VARCHAR(30),
cdob DATE,
cphonenumber INTEGER,
cnationality VARCHAR(30),
csalary INTEGER,
PRIMARY KEY(cid),
FOREIGN KEY (fcid) REFERENCES club(fcid) ON DELETE CASCADE);

CREATE TABLE clubsbefore(cid INTEGER NOT NULL,
fcid INTEGER,
PRIMARY KEY(cid, fcid),
FOREIGN KEY (cid) REFERENCES coach(cid) ON DELETE CASCADE,
FOREIGN KEY (fcid) REFERENCES club(fcid));

CREATE TABLE treat(did INTEGER,
pid INTEGER NOT NULL,
pinjury VARCHAR(30),
injureduntilnow BIT,
PRIMARY KEY(pid, did, pinjury),
FOREIGN KEY (did) REFERENCES doctor(did) ON DELETE CASCADE,
FOREIGN KEY (pid) REFERENCES player(pid) ON DELETE CASCADE);

/*-------------------*/

INSERT INTO homestadium values ("Santiago Bernabeu","Real Madrid",86000,120);
INSERT INTO club values (1,"Real Madrid","RMA",1902,"Madrid","Santiago Bernabeu"); 
INSERT INTO player values (1,1,"Karim Benzema",DATE ('1987-12-19'),75369865,"France",14200000,9,"ST","Contract");
INSERT INTO player values (1,2,"Sergio Ramos",DATE ('1986-03-30'),78965412,"Spain",15000000,4,"CB","Contract");
INSERT INTO player values (1,3,"Luka Modric",DATE ('1985-09-09'),75369852,"Croatia",9360000,10,"CM","Contract");
INSERT INTO player values (1,4,"Thibaut Courtois",DATE ('1992-05-11'),78936524,"Belguim",7200000,1,"GK","Contract");
INSERT INTO player values (1,5,"Dani Carvajal",DATE ('1992-01-11'),78963753,"Spain",7000000,2,"RB","Contract");
INSERT INTO player values (1,6,"Ã‰der MilitÃ£o",DATE ('1998-01-18'),78456321,"Brazil",5000000,3,"CB","Contract");
INSERT INTO player values (1,7,"Raphael Varane",DATE ('1993-04-25'),78965432,"France",7200000,5,"CB","Contract");
INSERT INTO player values (1,8,"Nacho Fernandez",DATE ('1990-01-18'),74964321,"Spain",4300000,6,"CB","Contract");
INSERT INTO player values (1,9,"Marcelo Viera",DATE ('1988-05-12'),48635196,"Brazil",7200000,12,"LB","Contract");
INSERT INTO player values (1,10,"Alvaro Odriozola",DATE ('1995-12-14'),63251478,"Spain",5760000,19,"RB","Contract");
INSERT INTO player values (1,11,"Ferland Mendy",DATE ('1995-06-08'),58635126,"France",2500000,23,"LB","Contract");
INSERT INTO player values (1,12,"Eden Hazard",DATE ('1991-01-07'),46961324,"Belguim",20000000,7,"LW","Contract");
INSERT INTO player values (1,13,"Toni Kroos",DATE ('1990-01-04'),96358123,"Germany",10500000,8,"CM","Contract");
INSERT INTO player values (1,14,"Marco Asensio",DATE ('1996-01-21'),97846513,"Spain",10500000,11,"RW","Contract");
INSERT INTO player values (1,15,"Casemiro",DATE ('1992-02-23'),78946513,"Brazil",5500000,14,"CM","Contract");
INSERT INTO player values (1,16,"Fedrico Valverdi",DATE ('1998-07-22'),05965132,"Uruguay",3000000,15,"CM","Contract");
INSERT INTO player values (1,17,"Lucas Vazquez",DATE ('1991-07-01'),97846512,"Spain",5500000,17,"RW","Contract");
INSERT INTO player values (1,18,"Martin Odegaard",DATE ('1998-12-17'),78963356,"Norway",4000000,21,"CM","Contract");
INSERT INTO player values (1,19,"Isco",DATE ('1992-4-21'),84632512,"Spain",5900000,22,"CM","Contract");
INSERT INTO player values (1,20,"Luka Jovic",DATE ('1997-12-23'),48652543,"Spain",8600000,18,"ST","Contract");
INSERT INTO player values (1,21,"Mariano Diaz",DATE ('1993-08-01'),48963348,"Domnican Rp",3600000,24,"ST","Contract");
INSERT INTO player values (1,22,"Rodrygo",DATE ('2001-01-09'),98761223,"Brazil",3600000,25,"LW","Contract");
INSERT INTO player values (1,23,"Viniciuos",DATE ('2000-07-12'),64531635,"Brazil",3600000,20,"LW","Contract");
INSERT INTO captain values (2,1);
INSERT INTO coach values (1,1,"Zinedine Zidan",Date ('1972-06-23'),86326325,"France",14000000);
INSERT INTO coach values (1,2,"David Bettony",Date ('1971-11-23'),86342983,"France",5000000);


INSERT INTO doctor values (1,1,"Qoura Kaskos",Date ('1980-02-17'),89463322,"Spain",300000,"Bone");
INSERT INTO doctor values (1,2,"Mirna Leppi",Date ('1989-02-13'),89460523,"Spain",250000,"Cruciate ligament");

INSERT INTO trophy values (1,1956);
INSERT INTO trophy values (1,1957);
INSERT INTO trophy values (1,1958);
INSERT INTO trophy values (1,1959);
INSERT INTO trophy values (1,1960);
INSERT INTO trophy values (1,1966);
INSERT INTO trophy values (1,1998);
INSERT INTO trophy values (1,2000);
INSERT INTO trophy values (1,2002);
INSERT INTO trophy values (1,2014);
INSERT INTO trophy values (1,2016);
INSERT INTO trophy values (1,2017);
INSERT INTO trophy values (1,2018);


/*/********************************************/

INSERT INTO homestadium values ("New Camp","Barcelona",99345,112);
INSERT INTO club values (2,"Barcelona","FCB",1899,"Barcelona","New Camp");

INSERT INTO player values (2,24,"Marc Ter Stegen",DATE ('1992-04-30'),75366534,"Germany",4800000,1,"GK","Contract");
INSERT INTO player values (2,25,"Nubreto Neto",DATE ('1989-07-19'),78965230,"Brazil",3120000,13,"GK","Contract");
INSERT INTO player values (2,26,"Gerard Pique",DATE ('1987-02-02'),75985210,"Spain",10500000,3,"CB","Contract");
INSERT INTO player values (2,27,"Lionel Messi",DATE ('1987-06-24'),73652416,"Argentina",28000000,10,"RW","Contract");
INSERT INTO player values (2,28,"Sergio Bousqets",DATE ('1988-07-16'),78963361,"Spain",12400000,5,"CM","Contract");
INSERT INTO player values (2,29,"Jordi Alba",DATE ('1989-03-23'),78456395,"Spain",7200000,18,"LB","Contract");
INSERT INTO player values (2,30,"Miralem Pijanic",DATE ('1990-04-02'),78653210,"Bosnia",7200000,8,"CM","Contract");
INSERT INTO player values (2,31,"Antoine Griezmann",DATE ('1991-03-21'),7493218,"Spain",16600000,7,"RW","Contract");
INSERT INTO player values (2,32,"Martin Braithwaite",DATE ('1991-06-05'),48619678,"Denmark",624000,9,"ST","Contract");
INSERT INTO player values (2,33,"Sergio Roberto",DATE ('1992-02-07'),63514798,"Spain",8160000,20,"RB","Contract");
INSERT INTO player values (2,34,"Philippe Coutinho",DATE ('1996-06-12'),86352685,"Brazil",7000000,14,"LW","Contract");
INSERT INTO player values (2,35,"Samuel Umtiti",DATE ('1993-11-14'),46963265,"France",10000000,23,"CB","Contract");
INSERT INTO player values (2,36,"Clement Lenglit",DATE ('1995-06-17'),96810236,"France",3120000,15,"CB","Contract");
INSERT INTO player values (2,37,"Jonior Firpo",DATE ('1996-08-22'),97845126,"Spain",4000000,12,"LB","Contract");
INSERT INTO player values (2,38,"Franke De Jong",DATE ('1997-05-12'),78961322,"Netherlands",17000000,21,"CM","Contract");
INSERT INTO captain values (27,2);

INSERT INTO coach values (2,3,"Ronald Koman",Date ('1963-03-21'),56316654,"Netherlands",10000000);
INSERT INTO coach values (2,4,"Alfred Schreuder",Date ('1972-11-02'),84454554,"Netherlands",4000000);

INSERT INTO doctor values (2,3,"Ricard Pruna",Date ('1965-04-05'),98461535,"Spain",150000,"Psychologist");
INSERT INTO doctor values (2,4,"Daniel Medina",Date ('1950-08-25'),90806481,"Spain",270000,"Sergueon");

INSERT INTO trophy values (2,1992);
INSERT INTO trophy values (2,2006);
INSERT INTO trophy values (2,2009);
INSERT INTO trophy values (2,2011);
INSERT INTO trophy values (2,2015);

/********************************************/

INSERT INTO homestadium values ("Ramon Sanchez Pizjuan","Seville",43883,100);
INSERT INTO club values (3,"Seville","SEV",1890,"Seville","Ramon Sanchez Pizjuan");

INSERT INTO player values (3,39,"Luuk de Jond",DATE ('1990-08-27'),75366534,"Netherlands",8000000,9,"ST","Contract");
INSERT INTO player values (3,40,"Jesus Navas",DATE ('1985-011-21'),78654123,"Spain",3600000,16,"RB","Contract");
INSERT INTO player values (3,41,"Ivan Rakitic",DATE ('1988-03-10'),53695210,"Croatia",5000000,10,"CM","Contract");
INSERT INTO player values (3,42,"Diego Carlos",DATE ('1993-03-15'),89635361,"Brazil",2500000,20,"CB","Contract");
INSERT INTO player values (3,43,"Yassine Bounou",DATE ('1991-04-05'),78456395,"Morocco ",1200000,13,"GK","Contract");
INSERT INTO player values (3,44,"Munir El Haddadi",DATE ('1995-09-01'),78964210,"Spain",2500000,11,"ST","Contract");
INSERT INTO player values (3,45,"Yuossed En-Nesyri",DATE ('1997-06-01'),7492128,"Morocco",2400000,15,"ST","Contract");
INSERT INTO player values (3,46,"Oscar Rodriguez",DATE ('1998-06-28'),48351678,"Spain",2000000,14,"CM","Contract");
INSERT INTO player values (3,47,"Nemanja Gudelj",DATE ('1991-11-16'),63214898,"Serbia",3000000,6,"CM","Contract");
INSERT INTO player values (3,48,"Jules Kounde",DATE ('1998-11-12'),58635685,"France",2500000,12,"CB","Contract");
INSERT INTO player values (3,49,"Tomas Vaclik",DATE ('1989-03-29'),46961465,"Czech",1500000,1,"GK","Contract");
INSERT INTO player values (3,50,"Fernando Reges",DATE ('1987-06-25'),96352365,"Brazil",3900000,25,"CM","Contract");
INSERT INTO player values (3,51,"Joan Jordan",DATE ('1994-06-06'),97846516,"Spain",3000000,8,"CM","Contract");
INSERT INTO player values (3,52,"Oliver Torres",DATE ('1994-11-10'),78946322,"Spain",6000000,21,"CM","Contract");
INSERT INTO player values (3,53,"Franco Vazquez",DATE ('1989-02-22'),97851326,"Argentina",4000000,22,"CM","Contract");
INSERT INTO player values (3,54,"Sergi Gomez",DATE ('1992-03-28'),78946522,"Spain",5000000,3,"CB","Contract");
INSERT INTO player values (3,55,"Sergio Escudero",DATE ('1989-09-02'),97851326,"Spain",1750000,18,"LB","Contract");
INSERT INTO player values (3,56,"Lucas Ocampos",DATE ('1994-06-11'),78935041,"Argentina",4000000,5,"LW","Contract");
INSERT INTO captain values (40,3);

INSERT INTO coach values (3,5,"Julen Lopetegui",Date ('1966-08-28'),978465132,"Spain",21000000);
INSERT INTO coach values (3,6,"Pepe Conde",Date ('1977-08-07'),98465324,"Spain",3000000);

INSERT INTO doctor values (3,5,"Vishale Sharma",Date ('1978-01-07'),75362226,"Spain",190000,"Bone");
INSERT INTO doctor values (3,6,"Mikel Dombez",Date ('1988-12-07'),98465332,"Spain",8319,"Physical");


/*-----------------------------*/

INSERT INTO homestadium values ("Allianz Arena","Bayern Munchen",75000,130);
INSERT INTO club values (4,"Bayern Munchen","FCB",1900,"Munich","Allianz Arena");

INSERT INTO player values (4,57,"Alexander Nubel",DATE ('1996-09-30'),78541230,"Germany",832000,35,"GK","Contract");
INSERT INTO player values (4,58,"Niklas Sule",DATE ('1995-09-03'),75369810,"Germany",2700000,4,"CB","Contract");
INSERT INTO player values (4,59,"Serge Gnabry",DATE ('1995-07-14'),78952416,"Germany",6400000,7,"RW","Contract");
INSERT INTO player values (4,60,"Joshua Kimmich",DATE ('1995-02-08'),896375361,"Germany",9100000,6,"CM","Contract");
INSERT INTO player values (4,61,"David Alaba",DATE ('1992-06-24'),78632195,"Austria",9100000,27,"LB","Contract");
INSERT INTO player values (4,62,"Leon Goretzka",DATE ('1995-02-06'),78965210,"Germany",9100000,18,"CM","Contract");
INSERT INTO player values (4,63,"Robert Lewandowski",DATE ('1988-08-21'),9632128,"Poland",18300000,9,"ST","Contract");
INSERT INTO player values (4,64,"Leroy Sane",DATE ('1996-01-11'),48635178,"Germany",15500000,10,"LW","Contract");
INSERT INTO player values (4,65,"Benjamin Pavard",DATE ('1996-03-28'),65147898,"France",6400000,5,"RB","Contract");
INSERT INTO player values (4,66,"Kingsley Coman",DATE ('1996-06-13'),63512685,"France",7300000,29,"LW","Contract");
INSERT INTO player values (4,67,"Jerome Boateng",DATE ('1988-09-03'),96132465,"Germany",10900000,17,"CB","Contract");
INSERT INTO player values (4,68,"Lucas Hernandez",DATE ('1996-02-14'),35812365,"France",12300000,21,"CB","Contract");
INSERT INTO player values (4,69,"Alphonso Davies",DATE ('2000-11-02'),97846326,"Canada",4700000,19,"LB","Contract");
INSERT INTO player values (4,70,"Thomas Muller",DATE ('1989-09-13'),78651322,"Germany",13700000,25,"CM","Contract");
INSERT INTO player values (4,71,"Manuel Neuer",DATE ('1986-03-27'),75366534,"Germany",16400000,1,"GK","Contract");
INSERT INTO captain values (71,4);

INSERT INTO coach values (4,7,"Hansi Flick ",Date ('1965-02-24'),49864320,"Gemany",10000000);
INSERT INTO coach values (4,8,"Tony Tapalovic",Date ('1980-10-10'),85445454,"Croatia",2500000);

INSERT INTO doctor values (4,7,"Nickolas Pruna",Date ('1988-04-05'),49865144,"Austria",350000,"Psychologist");
INSERT INTO doctor values (4,8,"Daniel Medina",Date ('1979-08-25'),94864423,"Germany",170000,"Sergueon");

INSERT INTO trophy values (4,1974);
INSERT INTO trophy values (4,1975);
INSERT INTO trophy values (4,1976);
INSERT INTO trophy values (4,2001);
INSERT INTO trophy values (4,2013);
INSERT INTO trophy values (4,2019);

/*************************************************/

INSERT INTO homestadium values ("Anfield","Liverpool",53394,120);
INSERT INTO club values (5,"Liverpool","LIV",1890,"Liverpool","Anfield");
INSERT INTO player values (5,72,"Alisson Becker",DATE ('1992-10-02'),65124865,"Brazil",4700000,1,"GK","Contract");
INSERT INTO player values (5,73,"Jordan Henderson",DATE ('1990-06-17'),78625556,"England",5200000,14,"CM","Contract");
INSERT INTO player values (5,74,"Mohammed Salah",DATE ('1992-06-15'),64510066,"Egypt",23100000,11,"RW","Contract");
INSERT INTO captain values (73,5);

INSERT INTO coach values (5,9,"Jurgen Klopp",Date ('1976-06-16'),89746323,"Germany",15000000);

INSERT INTO doctor values (5,9,"Jurgeniuo emerick",Date ('2000-12-12'),75641133,"Germany",5655,"Physical");

INSERT INTO trophy values (5,1977);
INSERT INTO trophy values (5,1978);
INSERT INTO trophy values (5,1981);
INSERT INTO trophy values (5,1984);
INSERT INTO trophy values (5,2005);

/*-----------------------*/

INSERT INTO homestadium values ("Emirate Stadium","London",62260,115);
INSERT INTO club values (6,"Arsenal","ARS",1886,"London","Emirate Stadium");
INSERT INTO player values (6,75,"Davil Luiz",DATE ('1987-04-22'),98460511,"Brazil",8500000,23,"CB","Contract");
INSERT INTO player values (6,76,"Mesut Ozil",DATE ('1988-10-15'),98464534,"Germany",18200000,10,"CM","Contract");
INSERT INTO player values (6,77,"Dani Ceballos",DATE ('1996-08-07'),849001323,"Spain",2700000,8,"CM","Loan");
INSERT INTO player values (6,78,"Pierre-Emerick Aubameyang",DATE ('1989-06-18'),75642333,"Gabon",20000000,14,"ST","Contract");
INSERT INTO captain values (78,6);
INSERT INTO coach values (6,10,"Mikel Arteta",Date ('1982-03-26'),65132845,"Spain",3640000);

INSERT INTO doctor values (6,10,"Micheal jonny",Date ('1962-12-12'),46513196,"England",9465132,"Physical");

/*------------------------------------------------*/



INSERT INTO homestadium values ("San Siro","Milan",80018,110);
INSERT INTO club values (7,"Ac Milan","ACM",1899,"Milan","San Siro");
INSERT INTO player values (7,79,"Zlatan Ibrahimovic",DATE ('1981-10-03'),98465221,"Sweden",7200000,11,"ST","Contract");
INSERT INTO player values (7,80,"Gianluigi Donnarumma",DATE ('1999-02-25'),99841314,"Italy",15000,99,"GK","Contract");
INSERT INTO player values (7,81,"Alessio Romagnoli",DATE ('1995-01-12'),94860323,"Italy",3500000,13,"RW","Contract");
INSERT INTO captain values (81,7);
INSERT INTO coach values (7,11,"Stefano Pioli",Date ('2000-12-12'),94865363,"Italy",4563300);
INSERT INTO doctor values (7,11,"Stefe Osten",Date ('2000-12-12'),84651333,"Italy",700000,"Physical");

INSERT INTO trophy values (7,1963);
INSERT INTO trophy values (7,1969);
INSERT INTO trophy values (7,1989);
INSERT INTO trophy values (7,1990);
INSERT INTO trophy values (7,1994);
INSERT INTO trophy values (7,2003);
INSERT INTO trophy values (7,2007);


/*--------------------------------------------------*/

INSERT INTO homestadium values ("Old Traford","Manchester",78000,130);
INSERT INTO club values (8,"Manchester United","MUN",1890,"Manchester","Old Traford");
INSERT INTO player values (8,82,"Paul Pogba",DATE ('1993-03-15'),05956519,"France",15080000,6,"CM","Contract");
INSERT INTO player values (8,83,"Marcus Rashford",DATE ('1990-9-9'),05422992,"England",10400000,10,"ST","Contract");
INSERT INTO player values (8,84,"Harry Maguire",DATE ('1993-03-04'),49860326,"England",9900000,5,"CB","Contract");
INSERT INTO captain values (74,8);
INSERT INTO coach values (8,12,"Ole Gunnar Solskjaer",Date ('2000-12-12'),94051334,"Norway",5655);
INSERT INTO doctor values (8,12,"Mohammd Ali",Date ('2000-12-12'),05999639,"Norway",5655,"Physical");

INSERT INTO trophy values (8,1997);
INSERT INTO trophy values (8,1999);
INSERT INTO trophy values (8,2008);

/*----------------------------------------------*/

INSERT INTO homestadium values ("Signal Iduna Park","Dortmund",81365,90);
INSERT INTO club values (9,"Borusia Dortmund","BVB",1909,"Dortmund","Signal Iduna Park");
INSERT INTO trophy values (9,1996);


/*----------------------------------------------*/

INSERT INTO homestadium values ("Giuseppe Meazza","Milan",75923,115);
INSERT INTO club values (10,"Inter Milan","INT",1908,"Milan","Giuseppe Meazza");
INSERT INTO trophy values (10,1964);
INSERT INTO trophy values (10,1965);
INSERT INTO trophy values (10,2010);

/*----------------------------------------------*/

INSERT INTO homestadium values ("Stamford Bridge","London",41837,105);
INSERT INTO club values (11,"Chelsea","CHE",1905,"London","Stamford Bridge");
INSERT INTO trophy values (11,2012);


/*----------------------------------------------*/

INSERT INTO homestadium values ("Goodison Park","Liverpool",39572,75);
INSERT INTO club values (12,"Everton","EVE",1878,"London","Goodison Park");


/*----------------------------------------------*/

INSERT INTO homestadium values ("Johan Cruijff Arena","Amesterdam",55500,112);
INSERT INTO club values (13,"Ajax","AJX",1900,"Amesterdam","Johan Cruijff Arena");
INSERT INTO trophy values (13,1971);
INSERT INTO trophy values (13,1972);
INSERT INTO trophy values (13,1973);
INSERT INTO trophy values (13,1995);


/*----------------------------------------------*/
INSERT INTO clubsbefore values (3,12);
INSERT INTO clubsbefore values (9,9);


INSERT INTO treat values (1,1,"INJURY1",0);
INSERT INTO treat values (1,1,"INJURY2",0);
INSERT INTO treat values (1,1,"INJURY3",0);
INSERT INTO treat values (1,1,"INJURY4",1);
INSERT INTO treat values (1,2,"INJURY1",0);