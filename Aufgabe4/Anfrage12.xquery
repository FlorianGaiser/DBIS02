xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{for	$k in Ferienwohnungsagentur/Kunde
let $KundeMitBelegung := Ferienwohnungsagentur/Belegung/Kunde
where not ($k/@Kundennummer = $KundeMitBelegung)	  
return <KundeOhneBelegung>{$k/@Kundennummer}</KundeOhneBelegung> }
</Ergebnis>