xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{
let $avg := avg(for $f in Ferienwohnungsagentur/Ferienwohnung,
    $a in Ferienwohnungsagentur/Adresse,
    $o in Ferienwohnungsagentur/Ort
let $items := (Ferienwohnungsagentur/Ferienwohnung/Gr��e)

where

$f/Adresse = $a/@AdressenID and
    $a/Ort = $o/@OrtID and
    $o/Land = 'Frankreich'


return
   <result>
      <avg>{$f/Gr��e }</avg>
   </result>)
return <Durschnittsgr��e>{$avg}</Durschnittsgr��e>

}
</Ergebnis>