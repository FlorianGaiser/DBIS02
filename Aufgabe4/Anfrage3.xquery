xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";
<Ergebnis>
{for $k in Ferienwohnungsagentur/Kunde,
	$b in Ferienwohnungsagentur/Belegung,
	$o in Ferienwohnungsagentur/Ort,
	$a in Ferienwohnungsagentur/Adresse
where $b/Statusflag = 'Reservierung' and
	  $b/Ferienwohnung = 1 and
	  $k/@Kundennummer = $b/Kunde and
	  $k/Adresse = $a/@AdressenID and
      $a/Ort = $o/@OrtID
return<Ausgabe>{($k/Vorname, $k/Name, $k/E-Mailadresse, $k/Telefonnummer, $a, $o/Land)}</Ausgabe>}
</Ergebnis>