xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{for	$b in Ferienwohnungsagentur/Belegung,
		$k in Ferienwohnungsagentur/Kunde
let $Kunde := $k/@Kundennummer	
where $b/Kunde = $Kunde
group by $Kunde
return <MitBelegung>{$Kunde}</MitBelegung> }
</Ergebnis>