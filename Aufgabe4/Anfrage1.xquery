xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";
<Ergebnis>
{for $f in Ferienwohnungsagentur/Ferienwohnung,
$b in Ferienwohnungsagentur/Belegung
where $f/@Wohnungsnummer = $b/Ferienwohnung and
$f/@Wohnungsnummer = 10 
return <Ausgabe>{$b}</Ausgabe>}
</Ergebnis>