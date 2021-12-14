xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{
for $l in Ferienwohnungsagentur/Land
    order by $l/@Name
    return
        <Land>
           { 
             $l/@Name,
             for $o in Ferienwohnungsagentur/Ort[Land = $l/@Name],
                 $a in Ferienwohnungsagentur/Adresse[Ort = $o/@OrtID],
                 $f in Ferienwohnungsagentur/Ferienwohnung[Adresse = $a/@AdressenID],
                 $b in Ferienwohnungsagentur/Belegung[Ferienwohnung = $f/@Wohnungsnummer]
             order by $a/Ort
             count $counter
             return
                <AnzahlBelegungen>
                   {
                     $counter
                   }
                </AnzahlBelegungen> 
           }
        </Land> 
}
</Ergebnis>