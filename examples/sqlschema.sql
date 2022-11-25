CREATE TABLE beispiel ( 
    name CHARACTER(255), -- TEXT-Feld mit fester Länge
    jahr INTEGER,
    studiengang VARYING CHARACTER(255), -- TEXT-Feld mit variabler Länge und Obergrenze
    PRIMARY KEY (name, jahr) -- Primärschlüssel aus mehreren Feldern
);

CREATE TABLE dozierende (
    name TEXT, -- TEXT-Feld mit variabler Länge ohne Obergrenze
    kuerzel CHARACTER(4) PRIMARY KEY -- TEXT-Feld als alleiniger Primärschlüssel
);

CREATE TABLE moduldozierende (
    modul_name CHARACTER(255),
    jahr INTEGER,
    kuerzel CHARACTER(4),
    FOREIGN KEY (kuerzel) REFERENCES dozierende (kuerzel), -- Fremdschlüssel für die Dozierenden
    FOREIGN KEY (modul_name, jahr) REFERENCES  beispiel (name, jahr) -- Fremdschlüssel für die Module
 );
 