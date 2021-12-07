xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";
<Ergebnis>
{for $b in Ferienwohnungsagentur/Belegung
where $b/Statusflag = 'Reservierung' and
	  $b/Kunde = 2
count $counter
return <Ausgabe>{$b/Statusflag} <Anzahl>{$counter}</Anzahl></Ausgabe>}
</Ergebnis>