// Dicke der Seitenwände und Fronten
dicke = 19;

// Luft zwischen den Fronten
luft = 3;

// Höhe des Fliesenspiegels unten und oben
fliesenspiegelUnten = 910;
fliesenspiegelOben = fliesenspiegelUnten + 600;

// Breiten 60 und 50cm
breite60 = 600;
breite50 = 495;

// Höhe und Tiefe der Unterschränke
hoeheUnter = 800;
tiefeUnter = 600;

// Höhe und Tiefe der Oberschränke
hoeheOber = 1000;
tiefeOber = 370;

// Dicke der Arbeitsplatte
dickeArbeitsplatte = 40;

// Höhe des Sockels
sockel = fliesenspiegelUnten - dickeArbeitsplatte - hoeheUnter;
echo("Sockel", sockel);

// Überstand der Türen in die Griffmulde nach oben
ueberstandOben = 10;
//ueberstandUnten = 3;

// Griffmulde oben
hoeheMuldeOben = 49;//49.3;
luftMuldeOben = hoeheMuldeOben - ueberstandOben;
muldeObenZ2 = hoeheUnter;
muldeObenZ1 = muldeObenZ2 - hoeheMuldeOben;

// Griffmulde Mitte
//hoeheGriffMitte = hoeheGriffOben;//63.6;
//griffMitteZ2 = 420;
//griffMitteZ1 = griffMitteZ2 - hoeheGriffMitte;



module Korpus(b, t, h, typ = "") {
    difference() {
        cube([b, t, h], false);
        
        translate([dicke, -1, dicke])
            cube([b-2*dicke, t+2, h-2*dicke], false);  
    }
    if (len(typ) > 0)
        echo(typ, b/10, t/10, h/10);
}
module KorpusUnter(b, t, h, typ = "") {
    difference() {
        cube([b, t, h], false);
        
        translate([dicke, -1, dicke])
            cube([b-2*dicke, t+2, h], false);  
    }
    if (len(typ) > 0)
        echo(typ, b/10, t/10, h/10);
}

module Griffmulde(b, h) {
    color([0, 0, 1])
        cube([b, 23, h], false);
}

// @param H Höhe über Nullpunkt
// @param b Breite
// @param h Höhe der Front
module Front(H, b, h) {
    // Zwischenräume rechts und links
    Z1 = H + luft/2;
    Z2 = H + h - luft/2;
    bl = b - luft;
    hl = h - luft;
    
    color([1, 1, 1])
    translate([luft/2, -dicke, Z1])
        cube([bl, dicke, hl], false);
    echo("Front",
        bl, hl, // Größe
        floor((Z1+90)/50)*50 - Z1, // Bohrung unten
        Z2 - ceil((Z2-90)/50)*50 // Bohrung oben
        );
    //echo("H", floor((H+90)/50)*50 - Hl);
}

// Front mit Griff horizontal oben mittig
// @param H Höhe über Nullpunkt
// @param b Breite
// @param h Höhe der Front
module GriffHOM(H, b, h) {
    Front(H, b, h);
    
    // Griffmaße
    A = 238;
    B = 45;
    O = 14;

    // Abstand von oben
    abstand = 50;
    
    color([1, 1, 1])
        translate([(b - A)/2, -dicke - B, H + h - abstand - O])
            cube([A, B, O], false);
}

// Front mit Griff horizontal oben rechts
// @param H Höhe über Nullpunkt
// @param b Breite
// @param h Höhe der Front
module GriffHOR(H, b, h) {
    Front(H, b, h);
    
    // Griffmaße
    A = 238;
    B = 45;
    O = 14;

    // Abstand von oben und rechts
    abstand = 50;
    
    color([1, 1, 1])
        translate([b - A - abstand, -dicke - B, H + h - abstand - O])
            cube([A, B, O], false);
}

// Front mit Griff horizontal unten rechts
// @param H Höhe über Nullpunkt
// @param b Breite
// @param h Höhe der Front
/*module GriffHUR(H, b, h) {
    Front(H, b, h);
    
    // Griffmaße
    A = 238;
    B = 45;
    O = 14;

    // Abstand von oben und rechts
    abstand = 50;
    
    color([1, 1, 1])
        translate([b - A - abstand, -dicke - B, H + h - abstand - O])
            cube([A, B, O], false);
}*/

// Front mit Griff vertikal oben links
// @param H Höhe über Nullpunkt
// @param b Breite
// @param h Höhe der Front
module GriffVOL(H, b, h) {
    Front(H, b, h);
    
    // Griffmaße
    A = 238;
    B = 45;
    O = 14;

    // Abstand von oben und links
    abstand = 50;
    
    color([1, 1, 1])
        translate([abstand, -dicke - B, H + h - abstand - A])
            cube([O, B, A], false);
}

// Front mit Griff horizontal unten rechts
// @param H Höhe über Nullpunkt
// @param b Breite
// @param h Höhe der Front
module GriffVUR(H, b, h) {
    Front(H, b, h);
    
    // Griffmaße
    A = 238;
    B = 45;
    O = 14;

    // Abstand von unten und rechts
    abstand = 50;
    
    color([1, 1, 1])
        translate([b - abstand - O, -dicke - B, H + abstand])
            cube([O, B, A], false);
}

// Front mit Griff vertikal unten links
// @param H Höhe über Nullpunkt
// @param b Breite
// @param h Höhe der Front
module GriffVUL(H, b, h) {
    Front(H, b, h);
    
    // Griffmaße
    A = 238;
    B = 45;
    O = 14;

    // Abstand von unten und links
    abstand = 50;
    
    color([1, 1, 1])
        translate([abstand, -dicke - B, H + abstand])
            cube([O, B, A], false);
}

// Ofen (595mm hoch)
// @param H Höhe über Nullpunkt
module Ofen(H) {
    color([0, 0, 0])
        translate([3, -dicke, H])
            //cube([594, dicke, 595 - 96], false);
            cube([594, dicke, 595 - 96], false);

    color([0.5, 0.5, 0.5])
        translate([3, -dicke, H + 595 - 96])
            cube([594, dicke, 96], false);
}

module Mikrowelle(H) {
    color([0, 0, 0])
        translate([2.5, -dicke, H])
            cube([495, dicke, 382], false);
}


// Unterschränke und Kühlschrank (relativ zum Sockel)
translate([0, -tiefeUnter, sockel]) {
    difference() {
        union() {
            // links: 4 Schubladen
            translate([0, 0, 0]) {
                KorpusUnter(breite60, tiefeUnter, hoeheUnter, "Unter alt");

                GriffHOM(0, breite60, 200);
                GriffHOM(200, breite60, 200);
                GriffHOM(400, breite60, 200);
                GriffHOM(600, breite60, 200 - luftMuldeOben);
                

                /*
                GriffHOM(0, breite60, griffMitteZ1 + ueberstandOben);
                z = griffMitteZ2 - ueberstandUnten;
                h = griffObenZ1 + ueberstandOben - z;
                GriffHOM(z, breite60, h/2 - luft);
                GriffHOM(z+h/2, breite60, h/2 - luft);
                */
            }
            
            // Spüle
            translate([600, 0, 0]) {
                KorpusUnter(breite60, tiefeUnter, hoeheUnter, "Ofen/Spüle alt");

                GriffHOR(0, breite60, hoeheUnter - luftMuldeOben);
            }
            
            // Geschirrspüler
            translate([1200, 0, 0]) {
                //KorpusUnter(breite60, tiefeUnter, hoeheUnter);
            
                GriffHOM(0, breite60, hoeheUnter - luftMuldeOben);
            }

            // Ofen
            translate([1800, 0, 0]) {
                KorpusUnter(breite60, tiefeUnter, hoeheUnter, "Ofen/Spüle neu");

                Ofen(166);
                GriffHOM(0, breite60, 166);
            }

            // Besteckkasten, 2 Schubladen
            translate([2400, 0, 0]) {
                KorpusUnter(breite50, tiefeUnter, hoeheUnter, "Unter alt");

                GriffHOM(0, breite50, 300);
                GriffHOM(300, breite50, 300);
                GriffHOM(600, breite50, 200 - luftMuldeOben);

/*
                GriffHOM(0, breite50, griffMitteZ1 + ueberstandOben);
                z = griffMitteZ2 - ueberstandUnten;
                h = griffObenZ1 + ueberstandOben - z;
                GriffHOM(z, breite50, h/2 - luft);
                GriffHOM(z+h/2, breite50, h/2 - luft);
*/
            }

            // Kühlschrank
            translate([2900, 0, 0]) {
                // Korpus Kühlschrank
                Korpus(breite60, tiefeUnter, 2000, "Kühlschrank neu");
                
                // Kühlschrank
                b = 558;
                h = 1770;
                t = 490;
                translate([(600-b)/2, 0, 18]) {
                    translate([0, 35, 0])
                    cube([b, t, h]);
                
                    color("red", 1.0) {
                        // untere Tür
                        translate([0, 0, 40])
                        cube([b, t, 645]);

                        // obere Tür
                        translate([0, 0, 760])
                        cube([b, t, 970]);
                    }
                    
                }
                
                // Kühlschranktüren
                //uh = 722+18; // max
                //uh = 695+18; // min
                uh = 735;
                GriffVOL(0, breite60, uh);
                GriffVUL(uh, breite60, 2000 - uh);
                
                
                // Korpus über Kühlschrank
                translate([0, 0, 2000]) {
                    h = 442;//fliesenspiegelOben + hoeheOber - (2000 + sockel);
                    Korpus(breite60, tiefeUnter, h, "Aufsatz neu");
                    GriffVUL(0, breite60, h);
                }
            }
            
            // Griffmulden
            translate([0, -1, hoeheUnter - hoeheMuldeOben])
                Griffmulde(4*600+500, hoeheMuldeOben);
            //translate([0, -1, griffMitteZ1])
            //    Griffmulde(600, hoeheGriffMitte);
            //translate([4*600, -1, griffMitteZ1])
            //    Griffmulde(500+19, hoeheGriffMitte);
        }
    } 
}


// Oberschränke (relativ zur Oberkante des Fliesenspiegels)
translate([0, -tiefeOber, fliesenspiegelOben]) {
    translate([0, 0, 0]) {
        Korpus(breite60, tiefeOber, hoeheOber, "Ober neu");
        GriffVUR(0, breite60, hoeheOber);
    }
    translate([600, 0, 0]) {
        Korpus(breite60, tiefeOber, hoeheOber, "Ober neu");
        GriffVUR(0, breite60, hoeheOber);       
    }
    translate([1200, 0, 0]) {
        Korpus(breite60, tiefeOber, hoeheOber, "Ober neu");
        GriffVUR(0, breite60, hoeheOber);       
    }

    // Wrasenabzug
    translate([1800, 0, hoeheOber - 600]) {
        Korpus(breite60, tiefeOber, 600, "Ober neu");
        GriffVUL(0, breite60, 600);       
    }

    // Mikrowelle
    translate([2400, 0, 0]) {
        Korpus(breite50, tiefeOber, hoeheOber, "Ober neu");
        
        Mikrowelle(0);
        //GriffVUL(385, breite50, hoeheOber - 385);
        GriffVUL(386, breite50, 614);
    }
}

echo("2x Abschlussplatte");
