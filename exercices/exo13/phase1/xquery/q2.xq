(: exo_12_XQuery_RSS_q2 Sur les fils RSS de l’ensemble du corpus, construire une requête pour extraire les contenus textuels des descriptions :)

let $docSource := doc("../test-3208-2017-v2-xq.xml")
(: let $docSource := doc("../3208-2017-v2-vComplete.xml") :)

for $description in $docSource//description
return <description> { string-join($description//data[@type="string"]/text(), " ")} </description>



