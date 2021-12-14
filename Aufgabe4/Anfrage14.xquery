xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{
for $f in Ferienwohnungsagentur/Ferienwohnung,
	$b in Ferienwohnungsagentur/Belegung, 
	$a in Ferienwohnungsagentur/Adresse,
	$o in Ferienwohnungsagentur/Ort
where $f/@Wohnungsnummer = $b/Ferienwohnung and
	  $f/Adresse = $a/@AdressenID and
	  $a/Ort = $o/@OrtID and
	  $o/Land = 'Frankreich' and
	  $b/Statusflag = 'Buchung'
return $f/@Wohnungsnummer
}
</Ergebnis>