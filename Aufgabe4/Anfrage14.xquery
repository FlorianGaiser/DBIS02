xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{
for $f in Ferienwohnungsagentur/Ferienwohnung,
	$b in Ferienwohnungsagentur/Belegung, 
	$a in Ferienwohnungsagentur/Adresse,
	$o in Ferienwohnungsagentur/Ort
let $Ferienwohnung := $f/@Wohnungsnummer
let $counter := count($f/@Wohnungsnummer)	
where $f/@Wohnungsnummer = $b/Ferienwohnung and
	  $f/Adresse = $a/@AdressenID and
	  $a/Ort = $o/@OrtID and
	  $o/Land = 'Frankreich' 
group by $Ferienwohnung  

let $DFeWo := count(
for $f in Ferienwohnungsagentur/Ferienwohnung,
	$a in Ferienwohnungsagentur/Adresse,
	$o in Ferienwohnungsagentur/Ort
where $f/Adresse = $a/@AdressenID and
	  $a/Ort = $o/@OrtID and
	  $o/Land = 'Deutschland' 
return $f)

return $Ferienwohnung[ count($counter)>$DFeWo]


}
</Ergebnis>


