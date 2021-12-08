xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{for	$f in Ferienwohnungsagentur/Ferienwohnung,
		$a in Ferienwohnungsagentur/Adresse,
		$o in Ferienwohnungsagentur/Ort,
		$fz in Ferienwohnungsagentur/FewoZusatz
let $FewoMitBelegung := Ferienwohnungsagentur/Belegung/Ferienwohnung
let $Fewo := $f/@Wohnungsnummer	
where $o/Land = 'Frankreich' and
	  $fz/Zusatzausattung = 'Schwimmbad'and
	  $f/Adresse = $a/@AdressenID and
	  $a/Ort = $o/@OrtID and
	  $f/@Wohnungsnummer = $fz/Wohnungsnummer and
	  not($f/@Wohnungsnummer = $FewoMitBelegung)
group by $Fewo		  
return <Ferienwohnung>{$Fewo}</Ferienwohnung>
union
(for $b in Ferienwohnungsagentur/Belegung,
	 $f in Ferienwohnungsagentur/Ferienwohnung,
	 $a in Ferienwohnungsagentur/Adresse,
	 $o in Ferienwohnungsagentur/Ort,
	 $fz in Ferienwohnungsagentur/FewoZusatz
let $Fewo := $f/@Wohnungsnummer	
where not($b/Statusflag = 'Buchung') and
	  $o/Land = 'Frankreich' and
	  $fz/Zusatzausattung = 'Schwimmbad'and
	  $b/Ferienwohnung = $f/@Wohnungsnummer and
	  $f/Adresse = $a/@AdressenID and
	  $a/Ort = $o/@OrtID and
	  $f/@Wohnungsnummer = $fz/Wohnungsnummer
group by $Fewo	  
return <Ferienwohnung>{$Fewo}</Ferienwohnung>)}
</Ergebnis>