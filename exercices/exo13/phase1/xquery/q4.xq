(: exo_12_XQuery_RSS_q4 Sur les fils RSS de l’ensemble du corpus, construire une requête pour extraire des patrons morphosyntaxiques NOM ADJ :)

let $docSource := doc("../test-3208-2017-v2-xq.xml")
(: let $docSource := doc("../3208-2017-v2-vComplete.xml") :)

for $element in $docSource//element
return 
if ( $element/data[@type="type"]/text() = 'NOM' and 
     $element/following-sibling::*[1]/data[@type="type"]/text() = 'ADJ' )  
then
  <element> 
  <nom> { $element//data[@type="string"]/text() } </nom> 
  <adj> { $element/following-sibling::*[1]/data[@type="string"]/text() } </adj>
  </element>
