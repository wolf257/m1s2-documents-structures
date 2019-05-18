(: Construire une requête pour extraire les contenus textuels des « titres ». :)

let $docSource := doc("../test-TALISMANE-3208.xml")

for $titre in $docSource//titre/p[@type="titre"]

return <titre> { string-join($titre/item/a[2], " ") } </titre>

