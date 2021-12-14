xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<Ergebnis>
{
let $items := (Ferienwohnungsagentur/Ferienwohnung/@Wohnungsnummer)
let $max := max($items)
return
   <result>
      <max>{$max}</max>     
   </result>
}
</Ergebnis>