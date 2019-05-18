(: exo_12_XQuery_RSS_q3 Sur les fils RSS de l’ensemble du corpus, construire une requête pour extraire les contenus textuels des titres ET descriptions :)

let $docSource := doc("../test-3208-2017-v2-xq.xml")
(: let $docSource := doc("../3208-2017-v2-vComplete.xml") :)

for $titre in $docSource//titre
for $description in $docSource//description
return <couple> 
         <titre> { string-join($titre//data[@type="string"]/text(), " ")} </titre>
         <description> { string-join($description//data[@type="string"]/text(), " ")} </description>
       </couple>

