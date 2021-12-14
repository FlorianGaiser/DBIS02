xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{for $b in Ferienwohnungsagentur/Belegung,
	$f in Ferienwohnungsagentur/Ferienwohnung,
	$a in Ferienwohnungsagentur/Adresse,
	$o in Ferienwohnungsagentur/Ort,
	$fz in Ferienwohnungsagentur/FewoZusatz
let $dateStart := xs:date('2016-05-01')
let $dateEnde := xs:date('2016-05-21')
where $o/Land = 'Türkei' and
	  $fz/Zusatzausattung = 'Schwimmbad'and
	  $b/Ferienwohnung = $f/@Wohnungsnummer and
	  $f/Adresse = $a/@AdressenID and
	  $a/Ort = $o/@OrtID and
	  $f/@Wohnungsnummer = $fz/Wohnungsnummer and
	  (($b/Anreisedatum < $dateStart and $b/Abreisedatum > $dateEnde)
	   or($b/Anreisedatum >= $dateStart and $b/Anreisedatum <= $dateEnde)
	   or($b/Abreisedatum >= $dateStart and $b/Abreisedatum <= $dateEnde)) 
return <Belegt>{$f/@Wohnungsnummer}</Belegt>  }
</Ergebnis>