(: Construire une requête pour extraire les contenus textuels des «titre ET descriptions ». :)

let $docSource := doc("../test-TALISMANE-3208.xml")

for $titre in $docSource//titre/p[@type="titre"]
for $desc in $docSource//description/p[@type="description"]

return <couple> 
         <titre> { string-join($titre/item/a[2], " ") } </titre>
         <description> { string-join($desc/item/a[2], " ") } </description>
       </couple>





