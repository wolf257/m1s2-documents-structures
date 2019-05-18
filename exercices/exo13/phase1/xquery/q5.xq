(: exo_12_XQuery_RSS_q5 Sur les fils RSS de l’ensemble du corpus, construire une requête pour extraire des patrons morphosyntaxiques NOM PRP NOM :)

let $docSource := doc("../test-3208-2017-v2-xq.xml")
(: let $docSource := doc("../3208-2017-v2-vComplete.xml") :)

for $element in $docSource//element
return 
if ( $element//data[@type="type"]/text() = 'NOM' and 
     $element/following-sibling::*[1]/data[@type="type"]/text() = 'PRP' and
     $element/following-sibling::*[2]/data[@type="type"]/text() = 'NOM' 
   )  
then
  <element> 
  <nom> { $element//data[@type="string"]/text() } </nom> 
  <prp> { $element/following-sibling::*[1]/data[@type="string"]/text() } </prp>
  <nom> { $element/following-sibling::*[2]/data[@type="string"]/text() } </nom>
  </element>


