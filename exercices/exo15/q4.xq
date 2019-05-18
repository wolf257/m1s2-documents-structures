(:Compter les modifications par copie:)
for $copie in collection('ECRISCOL')//TEI
let $id := $copie//head/text()
let $add := count(//mod[@type='add'])
let $subst := count(//mod[@type='subst'])
let $del := count(//mod[@type='del'])
let $corr := count(//mod[@type='corr'])
return (concat("ID : ", $id), concat("Ajouts : ", $add), concat("Substitutions : ", $subst), concat("Suppression : ", $del), concat("Correction : ", $corr), "******************")