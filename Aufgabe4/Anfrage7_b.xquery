xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{for $b in Ferienwohnungsagentur/Belegung,
	$f in Ferienwohnungsagentur/Ferienwohnung,
	$a in Ferienwohnungsagentur/Adresse,
	$o in Ferienwohnungsagentur/Ort,
	$fz in Ferienwohnungsagentur/FewoZusatz
where $b/Statusflag = 'Buchung' and
	  $o/Land = 'Frankreich' and
	  $fz/Zusatzausattung = 'Schwimmbad'and
	  $b/Ferienwohnung = $f/@Wohnungsnummer and
	  $f/Adresse = $a/@AdressenID and
	  $a/Ort = $o/@OrtID and
	  $f/@Wohnungsnummer = $fz/Wohnungsnummer
count $counter	  
return <Buchung>{$b/Ferienwohnung} <Anzahl>{$counter}</Anzahl> </Buchung>  }
</Ergebnis>