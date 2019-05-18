declare function local:Mods($niveau as xs:string?) as xs:string?
{ let $del := count(collection('ECRISCOL')//div[contains(./head, $niveau)]//mod[@type = 'del'])
let $add := count(collection('ECRISCOL')//div[contains(./head, $niveau)]//mod[@type = 'add'])
let $subst := count(collection('ECRISCOL')//div[contains(./head, $niveau)]//mod[@type = 'subst'])
let $corr := count(collection('ECRISCOL')//div[contains(./head, $niveau)]//mod[@type = 'corr'])
return concat(concat("Suppressions : ", $del), "&#10;", concat("Ajouts : ", $add), "&#10;", concat("Substitutions : ", $subst), "&#10;", concat("Corrections : ", $corr), "&#10;")};
let $doc := collection('ECRISCOL')//TEI
return ("CE1", local:Mods("CE1"), "CE2", local:Mods("CE2"), "CM1", local:Mods("CM1"), "CM2", local:Mods("CM2"), "6ème", local:Mods("6EME"), "3ème", local:Mods("-3-"), "2nde", local:Mods("-2-"), "UNIV", local:Mods("L1"))