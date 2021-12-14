xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{
let $sum:= sum(for $k in Ferienwohnungsagentur/Kunde,
	$b in Ferienwohnungsagentur/Belegung,
	$r in Ferienwohnungsagentur/Rechnung
let $items := (Ferienwohnungsagentur/Rechnung/Betrag)
where $k/@Kundennummer = $b/Kunde and	
	  $b/@Belegungsnummer = $r/Buchungsnummer and
	  $k/@Kundennummer = 2
return
   <result>
      <sum>{$r/Betrag }</sum>
   </result>)
   
   return <Summe_Rechnungen>{$sum}</Summe_Rechnungen>
}
</Ergebnis>