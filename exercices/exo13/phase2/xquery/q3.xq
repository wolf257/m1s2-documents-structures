(: Construire une requête pour extraire les contenus textuels des « descriptions ». :)

let $docSource := doc("../test-TALISMANE-3208.xml")

for $desc in $docSource//description/p[@type="description"]

return <description> { string-join($desc/item/a[2], " ") } </description>




