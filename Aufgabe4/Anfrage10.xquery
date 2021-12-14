xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{for	$f in Ferienwohnungsagentur/Ferienwohnung,
		$a in Ferienwohnungsagentur/Adresse,
		$o in Ferienwohnungsagentur/Ort,
		$fz in Ferienwohnungsagentur/FewoZusatz
let $FewoMitBelegung := Ferienwohnungsagentur/Belegung/Ferienwohnung
let $Fewo := $f/@Wohnungsnummer	
where $o/Land = 'Türkei' and
	  $fz/Zusatzausattung = 'Schwimmbad'and
	  $f/Adresse = $a/@AdressenID and
	  $a/Ort = $o/@OrtID and
	  $f/@Wohnungsnummer = $fz/Wohnungsnummer and
	  not($f/@Wohnungsnummer = $FewoMitBelegung)
group by $Fewo		  
return <NichtBelegt>{$Fewo}</NichtBelegt>
union
(for $b in Ferienwohnungsagentur/Belegung,
	$f in Ferienwohnungsagentur/Ferienwohnung,
	$a in Ferienwohnungsagentur/Adresse,
	$o in Ferienwohnungsagentur/Ort,
	$fz in Ferienwohnungsagentur/FewoZusatz
let $dateStart := xs:date('2016-05-01')
let $dateEnde := xs:date('2016-05-21')
let $Fewo := $f/@Wohnungsnummer	
where $o/Land = 'Türkei' and
	  $fz/Zusatzausattung = 'Schwimmbad'and
	  $b/Ferienwohnung = $Fewo and
	  $f/Adresse = $a/@AdressenID and
	  $a/Ort = $o/@OrtID and
	  $Fewo = $fz/Wohnungsnummer and
	  not(($b/Anreisedatum < $dateStart and $b/Abreisedatum > $dateEnde)
	   or($b/Anreisedatum >= $dateStart and $b/Anreisedatum <= $dateEnde)
	   or($b/Abreisedatum >= $dateStart and $b/Abreisedatum <= $dateEnde)) 
return <NichtBelegtimZeitraum>{$Fewo}</NichtBelegtimZeitraum> )}
</Ergebnis>