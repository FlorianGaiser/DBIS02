xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";
<Ergebnis>
{for $f in Ferienwohnungsagentur/Ferienwohnung,
	$b in Ferienwohnungsagentur/Belegung,
	$r in Ferienwohnungsagentur/Rechnung
where $f/@Wohnungsnummer = $b/Ferienwohnung and
	  $b/@Belegungsnummer = $r/Buchungsnummer and
	  $f/@Wohnungsnummer = 4
order by $r/Rechnungsdatum ascending, $r/Betrag descending
return <Ausgabe>{$r}</Ausgabe>}
</Ergebnis>
