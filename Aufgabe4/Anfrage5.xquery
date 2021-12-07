xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";
<Ergebnis>
{for $k in Ferienwohnungsagentur/Kunde,
	$b in Ferienwohnungsagentur/Belegung
where $k/@Kundennummer = $b/Kunde and
	  $b/Statusflag = 'Buchung' and 
	  $k/Name = "Meier"
return <Ausgabe>{$k/Name, $b}</Ausgabe>} (:Name hinzugefügt, man weiß zwar wer es ist da wir es angeben, aber bei Platzhalter wäre es nicht bekannt:)
</Ergebnis>